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

  {
    "johmsalas/text-case.nvim",
    event = "VeryLazy",
    config = function()
      -- Key mapping options
      local function opts(desc)
        return { desc = desc, noremap = true, silent = true }
      end

      local textcase = require("textcase")
      -- stylua: ignore start
      vim.keymap.set("n", "guc", function() textcase.operator('to_camel_case') end, opts("camelCase"))
      vim.keymap.set("n", "gud", function() textcase.operator('to_dash_case') end, opts("dash-case"))
      vim.keymap.set("n", "guj", function() textcase.operator('to_pascal_case') end, opts("JavaCase"))
      vim.keymap.set("n", "gun", function() textcase.operator('to_constant_case') end, opts("CONSTANT_CASE"))
      vim.keymap.set("n", "gup", function() textcase.operator('to_phrase_case') end, opts("Phrase case"))
      vim.keymap.set("n", "gus", function() textcase.operator('to_snake_case') end, opts("snake_case"))
      vim.keymap.set("n", "gut", function() textcase.operator('to_title_case') end, opts("Title Case"))

      vim.keymap.set("n", "guC", function() textcase.lsp_rename('to_camel_case') end, opts("camelCase - lsp"))
      vim.keymap.set("n", "guD", function() textcase.lsp_rename('to_dash_case') end, opts("dash-case - lsp"))
      vim.keymap.set("n", "guJ", function() textcase.lsp_rename('to_pascal_case') end, opts("JavaCase - lsp"))
      vim.keymap.set("n", "guN", function() textcase.lsp_rename('to_constant_case') end, opts("CONSTANT_CASE - lsp"))
      vim.keymap.set("n", "guP", function() textcase.lsp_rename('to_phrase_case') end, opts("Phrase case - lsp"))
      vim.keymap.set("n", "guS", function() textcase.lsp_rename('to_snake_case') end, opts("snake_case - lsp"))
      vim.keymap.set("n", "guT", function() textcase.lsp_rename('to_title_case') end, opts("Title Case - lsp"))
      -- stylua: ignore stop
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
        ["<leader>"] = {
          e = { name = "+edit" },
          g = { name = "+git" },
          s = { name = "+search" },
        },
        g = {
          name = "+go/got to",
          u = { name = "+textcase" },
        },
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
