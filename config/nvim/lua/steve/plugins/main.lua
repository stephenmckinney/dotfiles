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

  -- git
  -- TODO intall and set up tpope/vim-rhubarb to enable GBrowse
  {
    'tpope/vim-fugitive',
    cmd = 'Git',
    keys = {
      -- xmap <leader>dg :diffget<CR>\|:diffupdate<CR>
      -- { '<leader>dg', ':diffget<CR>\|:diffupdate<CR>', mode = 'x', desc = 'diffget' }
      -- xmap <leader>dp :diffput<CR>\|:diffupdate<CR>
      { '<leader>gB', '<cmd>Git blame<cr>', desc = 'git blame' },
      -- nmap <leader>gh :GBrowse<CR>
      -- nmap <leader>gc :Git commit<CR>
      { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = 'git diff' },
      { '<leader>gs', '<cmd>Git<cr>', desc = 'git status (window)' },
      { '<leader>gr', '<cmd>Gread<cr>', desc = 'git checkout (restore working tree file)' },
      { '<leader>gw', '<cmd>Gwrite<cr>', desc = 'git add (stage file)' },
   }
  },

  {
    'f-person/git-blame.nvim',
    init = function()
      vim.g.gitblame_enabled = 0
    end,
    keys = {
      { '<leader>gb', '<cmd>GitBlameToggle<cr>', desc = 'git blame (inline)' },
    }
  },

  -- pairs
  {
    'echasnovski/mini.pairs',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.pairs').setup {}
    end
  },
  -- surround
  {
    'echasnovski/mini.surround',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.surround').setup {}
    end
  },
  -- comment
	{
    'echasnovski/mini.comment',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.comment').setup {}
    end
  },
  -- Extend a/i textobjects
  {
    'echasnovski/mini.ai',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup {}
    end
  },
  -- handy keymaps
  { 'tpope/vim-unimpaired', enabled = false },
  -- enable repeating supported plugin maps with '.'
  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
  },
  -- end structures e.g. Ruby, lua, shell, vimscript, etc.
  {
    'tpope/vim-endwise',
    event = 'VeryLazy',
  },
}
