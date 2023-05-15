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
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {}
    end,
    keys = {
      { '<leader>d', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle File Explorer' },
    }
  }
}
