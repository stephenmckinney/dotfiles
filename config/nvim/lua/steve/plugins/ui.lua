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
        signcolumn = true,
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
    event = "VeryLazy",
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
