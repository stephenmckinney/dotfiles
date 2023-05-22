--------------------------------------------------------------------------------
-- IDE
--
-- Requirements:
-- * Robust Git support
-- * Editing super powers
--------------------------------------------------------------------------------
return {

  -- TODO mini-align
  -- TODO mini-splitjoin
  -- TODO mini-trailspace
  -- TODO intall and set up tpope/vim-rhubarb to enable GBrowse
  -- TODO lukas-reineke/indent-blankline.nvim or echasnovski/mini.indentscope

  ------------------------------------------------------------------------------
  -- Git
  ------------------------------------------------------------------------------

  -- A(n awesome) Git wrapper
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { "<leader>dg", "<cmd>diffget<CR>\\|:diffupdate<CR>", mode = "x", desc = "diffget" },
      { "<leader>dp", "<cmd>diffput<CR>\\|:diffupdate<CR>", mode = "x", desc = "diffput" },
      { "<leader>gB", "<cmd>Git blame<cr>", desc = "git blame (fugitive)" },
      { "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "git diff" },
      { "<leader>gs", "<cmd>Git<cr>", desc = "git status (fugitive)" },
      { "<leader>gr", "<cmd>Gread<cr>", desc = "Gread | git checkout (restore working tree file)" },
      { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Gwrite | git add (stage file)" },
      -- nmap <leader>gh :GBrowse<CR>
      -- nmap <leader>gc :Git commit<CR>
    },
  },

  -- Inline git blame
  {
    "f-person/git-blame.nvim",
    init = function()
      vim.g.gitblame_enabled = 0
    end,
    keys = {
      { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "git blame (inline)" },
    },
  },

  ------------------------------------------------------------------------------
  -- Editing super powers
  ------------------------------------------------------------------------------

  -- Autopairs
  {
    "echasnovski/mini.pairs",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.pairs").setup({})
    end,
  },
  -- Surround actions
  {
    "echasnovski/mini.surround",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup({})
    end,
  },
  -- Comment lines
  {
    "echasnovski/mini.comment",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.comment").setup({})
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
}
