--------------------------------------------------------------------------------
-- IDE
--
-- Requirements:
-- * Robust Git support
-- * Running tests
-- * Editing super powers
--------------------------------------------------------------------------------
return {

  -- TODO mini-align
  -- TODO mini-trailspace

  ------------------------------------------------------------------------------
  -- Git
  ------------------------------------------------------------------------------

  -- A(n awesome) Git wrapper
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { "<leader>dg", ":diffget<bar>diffudpate<cr>", mode = "x", desc = "diffget" },
      { "<leader>dp", ":diffput<bar>diffupdate<cr>", mode = "x", desc = "diffput" },
      { "<leader>gB", "<cmd>Git blame<cr>", desc = "git blame (fugitive)" },
      { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "git diff" },
      {
        "<leader>gs",
        function()
          local lines = math.ceil(vim.opt.lines:get() * 2 / 3)
          vim.cmd("Git")
          vim.api.nvim_win_set_height(0, lines)
        end,
        desc = "git status (fugitive)",
      },
      { "<leader>gr", "<cmd>Gread<cr>", desc = "Gread | git checkout (restore working tree file)" },
      { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Gwrite | git add (stage file)" },
      { "<leader>gc", "<cmd>Git commit<cr>", desc = "git commit" },
    },
  },

  -- Inline git blame
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.gitblame_enabled = false
    end,
    keys = {
      { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "git blame (inline)" },
      { "<leader>gh", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open GitHub commit URL" },
    },
  },

  -- test
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-vim-test",
      "vim-test/vim-test",
    },
    keys = {
      {
        "<leader>r",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Neotest: Run current test file",
      },
      {
        "<leader>R",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Neotest: Open summary window",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vim-test")({
            allow_file_types = { "lua" },
          }),
        },
      })
    end,
  },

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
  -- enable repeating supported plugin maps with '.'
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  -- Narrow Region
  {
    "chrisbra/NrrwRgn",
    event = "VeryLazy",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
