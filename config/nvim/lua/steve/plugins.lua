return {
  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescop',
    version = false,
    keys = {
      { '<leader>t', '<cmd>Telescope find_files<cr>', desc = 'Find Files (root dir)' },
      { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Buffers' }
    }
  }
}
