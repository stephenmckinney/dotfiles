return {
  ------------------------------------------------------------------------------
  -- Editing super powers
  ------------------------------------------------------------------------------

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Surround actions
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  -- Comment lines
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup({})
    end,
  },

  -- Extend a/i textobjects
  {
    "echasnovski/mini.ai",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.ai").setup({})
    end,
  },

  -- Align text interactively
  {
    "echasnovski/mini.align",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.align").setup({})
    end,
  },

  -- Split and join arguments
  {
    "echasnovski/mini.splitjoin",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.splitjoin").setup({
        mappings = {
          toggle = "gj",
        },
      })
    end,
  },

  -- Narrow Region
  {
    "chrisbra/NrrwRgn",
    event = "VeryLazy",
  },

  -- Visualize current indent scope. Add scope-related motions and textobjects.
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "VeryLazy",
    config = function()
      local indentscope = require("mini.indentscope")
      indentscope.setup({
        -- no animation
        animation = indentscope.gen_animation.none(),
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

  -- Move any selection in any direction
  {
    "echasnovski/mini.move",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.move").setup({
        mappings = {
          left = "<S-left>",
          right = "<S-right>",
          down = "<S-down>",
          up = "<S-up>",

          line_left = "<S-left>",
          line_right = "<S-right>",
          line_down = "<S-down>",
          line_up = "<S-up>",
        },
      })
    end,
  },

  -- Go forward/backward with square brackets
  {
    "echasnovski/mini.bracketed",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.bracketed").setup({})
    end,
  },

  -- enable repeating supported plugin maps with '.'
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  -- While typing display a popup of possible keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      local wk = require("which-key")

      wk.register({
        ["<leader>g"] = { name = "+git" },
        ["<leader>s"] = { name = "+search" },
      })
    end,
  },

  -- Displays colors based on their HEX/rgb/hsl value
  {
    "NvChad/nvim-colorizer.lua",
    cmd = { "ColorizerAttachToBuffer", "ColorizerToggle" },
    config = function()
      require("colorizer").setup({
        user_default_options = {
          -- disable name codes e.g. blue, red 
          names = false,
        },
      })
    end,
  },
}
