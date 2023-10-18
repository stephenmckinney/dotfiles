return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          disabled_filetypes = {
            "NvimTree",
            "neotest-summary",
            "help",
          },
        },
      })
    end,
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Navigate to next buffer" },
  --     { "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Navigate to previous buffer" },
  --   },
  --   config = function()
  --     require("bufferline").setup({
  --       options = {
  --         separator_style = "slope", -- slant, slope, thick, thin
  --         show_buffer_close_icons = false,
  --         show_close_icon = false,
  --         always_show_bufferline = false,
  --         offsets = {
  --           {
  --             filetype = "NvimTree",
  --             text = "File Explorer",
  --             highlight = "Directory",
  --             separator = true, -- use a "true" to enable the default
  --           },
  --           {
  --             filetype = "neotest-summary",
  --             text = "Test Summary",
  --             highlight = "Directory",
  --             separator = true, -- use a "true" to enable the default
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
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
          -- diagnostic signs
          {
            sign = {
              name = { "Diagnostic" },
              maxwidth = 2,
              auto = true,
            },
          },
          -- numbers
          {
            text = { builtin.lnumfunc, " " },
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
    config = function()
      local indentscope = require("mini.indentscope")
      indentscope.setup({
        -- Symbol priority. Increase to display on top of more symbols.
        draw = {
          priority = 2,
        },
        -- use cursor row to calculate indent scope
        options = {
          indent_at_cursor = false,
        },
        -- no motion key mappings
        mappings = {
          goto_top = "",
          goto_bottom = "",
        },
      })
    end,
  },

  -- Add indentation guides.
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup({
        -- disable scope highlighting
        scope = {
          enabled = false,
        },
        -- Symbol priority. Increase to display on top of more symbols.
        indent = {
          priority = 1,
        },
        exclude = {
          filetypes = {
            "help",
            "lazy",
            "mason",
          },
        },
      })
    end,
  },
}
