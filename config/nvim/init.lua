-- Set mapleader before plugins are required, to ensure plugins that rely on mapleader use the correct key
vim.g.mapleader = ','

-- Disabling the built-in netrw and netrwPlugin in favor of a file explorer plugin.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('steve.plugins')

-- Set configs
require 'steve.options'
