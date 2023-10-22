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
        pattern = {
          "help",
          "lazy",
          "mason",
          "NvimTree",
        },
        callback = function()
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
}
