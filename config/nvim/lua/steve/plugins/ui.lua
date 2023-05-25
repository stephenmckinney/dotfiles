return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({})
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    cmd = { "ColorizerAttachToBuffer", "ColorizerToggle" },
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
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
              auto = true
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
              wrap = true
            },
          },
        },
      })
    end,
  },
}
