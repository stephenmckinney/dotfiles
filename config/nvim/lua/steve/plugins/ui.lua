return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        options = {
          disabled_filetypes = {
            "NvimTree",
            "neotest-summary",
          },
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Navigate to next buffer" },
      { "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Navigate to previous buffer" },
    },
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slope", -- slant, slope, thick, thin
          show_buffer_close_icons = false,
          show_close_icon = false,
          always_show_bufferline = false,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              separator = true, -- use a "true" to enable the default
            },
            {
              filetype = "neotest-summary",
              text = "Test Summary",
              highlight = "Directory",
              separator = true, -- use a "true" to enable the default
            },
          },
        },
      })
    end,
  },
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
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup()
    end,
  },
}
