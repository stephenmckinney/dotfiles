return {
  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    version = false,
    keys = {
      { '<leader>t', '<cmd>Telescope find_files<cr>', desc = 'Find Files (root dir)' },
      { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Buffers' }
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
