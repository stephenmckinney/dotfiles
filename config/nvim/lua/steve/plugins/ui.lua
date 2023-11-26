local Util = require("steve.util")

return {
  -- Configurable statusline using lua.
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "tokyonight",
        disabled_filetypes = {
          "NvimTree",
          "neotest-summary",
          "help",
        },
      },
    },
  },

  -- Configurable status column with gitsigns and diagnostic signs.
  {
    "luukvbaal/statuscol.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        segments = {
          -- fold column
          {
            text = { builtin.foldfunc },
          },
          -- numbers
          {
            text = { builtin.lnumfunc, " " },
          },
          -- gitsigns
          {
            sign = {
              namespace = {
                "gitsigns",
              },
              colwidth = 1,
              wrap = true,
            },
          },
          -- diagnostic signs
          {
            sign = {
              name = { "Diagnostic" },
              maxwidth = 2,
              auto = true,
            },
          },
          -- a sign segment that is only 1 cell wide that shows all other signs
          {
            sign = {
              name = { ".*" },
              maxwidth = 2,
              colwidth = 1,
              auto = true,
              wrap = true,
            },
          },
        },
      })

      -- setup gitsigns
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
      })
    end,
  },

  -- Visualize current indent scope. Add scope-related motions and textobjects.
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "VeryLazy",
    opts = {
      symbol = "│",
      -- place cursor on function header to get scope of its body
      options = { try_as_border = true },
      -- no motion key mappings
      mappings = { goto_top = "", goto_bottom = "" },
    },
    -- disable for help, plugin managers, etc.
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        group = Util.augroup("miniindentscope_disable"),
        pattern = {
          "help",
          "lazy",
          "mason",
          "NvimTree",
        },
        callback = function()
          ---@diagnostic disable-next-line: inject-field
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- Add indentation guides.
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
      -- disable scope highlighting
      scope = { enabled = false },
      indent = {
        char = "│",
        tab_char = "│",
      },
      exclude = {
        filetypes = {
          "help",
          "lazy",
          "mason",
          "NvimTree",
        },
      },
    },
    main = "ibl",
  },

  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      -- map [[ and ]] to goto prev/next reference
      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        group = Util.augroup("vim_illuminate_keymaps"),
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
}
