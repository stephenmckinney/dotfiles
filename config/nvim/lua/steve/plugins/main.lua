return {
  -- fuzzy finder
  -- TODO add treesitter
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    config = function()
      require('telescope').setup {}
      require('telescope').load_extension('fzf')
    end,
    keys = {
      { '<leader>t', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Find open buffers' },
      { '<leader>f', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep search in current directory' },
      { '<leader>F', '<cmd>Telescope grep_string<cr>', desc = 'Grep search for the string under your cursor or selection in current directory' },
      { '<leader>h', '<cmd>Telescope help_tags<cr>', desc = 'Find help tags' },
    }
  },

  -- file explorer
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {}
    end,
    keys = {
      { '<leader>d', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle File Explorer' },
      { '<leader>D', '<cmd>NvimTreeFindFile<cr>', desc = 'Find current file in File Explorer' },
    },
  },

  -- handy keymaps
  { 'tpope/vim-unimpaired', enabled = false },

  -- enable repeating supported plugin maps with '.'
  { 'tpope/vim-repeat' },

  -- pairs
  { 'echasnovski/mini.pairs',
    version = false,
    config = function()
      require('mini.pairs').setup {}
    end
  },
  -- surround
  { 'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup {}
    end
  },
  -- comment
	{ 'echasnovski/mini.comment',
    version = false,
    config = function()
      require('mini.comment').setup {}
    end
  },
  -- Extend a/i textobjects
  { 'echasnovski/mini.ai',
    version = false,
    config = function()
      require('mini.ai').setup {}
    end
  },
}
