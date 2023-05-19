return {
  -- TODO /coding/treesitter, coding/lsp, coding/core, editor, ui
  -- TODO lukas-reineke/indent-blankline.nvim or echasnovski/mini.indentscope
  -- TODO mini-align
  -- TODO mini-splitjoin
  -- TODO mini-trailspace


  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      -- Syntax aware text-objects, select, move, swap, and peek support e.g. mini.ai.
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      -- Treesitter aware way to wisely add "end" in Ruby, Vimscript, Lua, etc.
      { 'RRethy/nvim-treesitter-endwise' },
    },
    keys = {
      { '<leader>i', desc = 'Init incremental selection' },
      { 'gi', desc = 'Increment selection', mode = 'x' },
      { 'gd', desc = 'Decrement selection', mode = 'x' },
      { 'gs', desc = 'Increment scope selection', mode = 'x' },
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            -- mode = normal
            init_selection = '<leader>i',
            -- mode = visual (x)
            node_incremental = 'gi',
            node_decremental = 'gd',
            scope_incremental = 'gs',
          },
        },
        ensure_installed = {
          'bash',
          'c',
          'css',
          'diff',
          'html',
          'go',
          'graphql',
          'javascript',
          'json',
          'lua',
          'luadoc',
          'luap',
          'markdown',
          'markdown_inline',
          'python',
          'query',
          'regex',
          -- 'ruby,', -- broken
          'scss',
          'sql',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },
      }
    end,
  },
 
  -- fuzzy finder
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
      -- quick find
      { '<leader>t', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Find open buffers' },
      -- quick grep
      { '<leader>a', '<cmd>Telescope grep_string<cr>', desc = 'Grep search for the string under your cursor or selection in current directory' },
      { '<leader>A', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep search in current directory' },
      -- 'search' leaders
      { '<leader>sa', '<cmd>Telescope autocommands<cr>', desc = 'Lists vim autocommands and goes to their declaration on <cr>' },
      { '<leader>sb', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Live fuzzy search inside of the currently open buffer' },
      { '<leader>sc', '<cmd>Telescope command_history<cr>', desc = 'Lists commands that were executed recently, and reruns them on <cr>' },
      { '<leader>sC', '<cmd>Telescope commands<cr>', desc = 'Lists available plugin/user commands and runs them on <cr>' },
      { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = 'Find help tags' },
      { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Lists normal mode keymappings' },
      { '<leader>sm', '<cmd>Telescope marks<cr>', desc = 'Lists vim marks and their value' },
      { '<leader>sM', '<cmd>Telescope man_pages<cr>', desc = 'Lists manpage entries, opens them in a help window on <cr>' },
      { '<leader>so', '<cmd>Telescope oldfiles<cr>', desc = 'Lists previously open files' },
      { '<leader>sr', '<cmd>Telescope resume<cr>', desc = 'Lists the results incl. multi-selections of the previous picker' },
      { '<leader>ss', '<cmd>Telescope search_history<cr>', desc = 'Lists searches that were executed recently, and reruns them on <cr>' },
      -- search vim
      { '<leader>svc', '<cmd>Telescope colorscheme<cr>', desc = 'Lists available colorschemes and applies them on <cr>' },
      { '<leader>svh', '<cmd>Telescope highlights<cr>', desc = 'Lists all available highlights' },
      { '<leader>svo', '<cmd>Telescope vim_options<cr>', desc = 'Lists vim options, allows you to edit the current value on <cr>' },
      { '<leader>svf', '<cmd>Telescope filetypes<cr>', desc = 'Lists all available filetypes' },
      -- git
      { '<leader>gl', '<cmd>Telescope git_commits<CR>', desc = 'git log' },
      { '<leader>gS', '<cmd>Telescope git_status<CR>', desc = 'git status (telescope)' },
    }
  },

  -- Search/replace in multiple files
  {
    'nvim-pack/nvim-spectre',
    config = function()
      require('spectre').setup {
        highlight = {
          replace = '@text.danger'
        },
        mapping = {
          ['run_current_replace'] = {
            map = '<leader>r',
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = 'replace current line'
          },
          ['run_replace'] = {
            map = '<leader>R',
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = 'replace all'
          },
        }
      }
    end,
    keys = {
      { '<leader>r', '<cmd>lua require("spectre").open()<CR>', desc = "Open search and replace (Spectre)" },
      { '<leader>rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search and replace current word under cursor (Spectre)" },
      { '<leader>rw', '<esc><cmd>lua require("spectre").open_visual()<CR>', mode = 'x', desc = "Search and replace currently selection (Spectre)" },
      { '<leader>rc', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search and replace on current file (Spectre)" },
    },
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
      { '<leader>dg', '<cmd>diffget<CR>\\|:diffupdate<CR>', mode = 'x', desc = 'diffget' },
      { '<leader>dp', '<cmd>diffput<CR>\\|:diffupdate<CR>', mode = 'x', desc = 'diffput' },
      { '<leader>gB', '<cmd>Git blame<cr>', desc = 'git blame (fugitive)' },
      { '<leader>gd', '<cmd>Gvdiffsplit<cr>', desc = 'git diff' },
      { '<leader>gs', '<cmd>Git<cr>', desc = 'git status (fugitive)' },
      { '<leader>gr', '<cmd>Gread<cr>', desc = 'Gread | git checkout (restore working tree file)' },
      { '<leader>gw', '<cmd>Gwrite<cr>', desc = 'Gwrite | git add (stage file)' },
      -- nmap <leader>gh :GBrowse<CR>
      -- nmap <leader>gc :Git commit<CR>
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

  -- Autopairs
  {
    'echasnovski/mini.pairs',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.pairs').setup {}
    end
  },
  -- Surround actions
  {
    'echasnovski/mini.surround',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.surround').setup {}
    end
  },
  -- Comment lines
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
  -- Move any selection in any direction
  {
    'echasnovski/mini.move',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.move').setup {}
    end
  },
  -- Go forward/backward with square brackets
  {
    'echasnovski/mini.bracketed',
    version = false,
    event = 'VeryLazy',
    config = function()
      require('mini.bracketed').setup {}
    end
  },
  -- enable repeating supported plugin maps with '.'
  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
  },
  -- Narrow Region
  {
    'chrisbra/NrrwRgn',
    event = 'VeryLazy'
  },
}
