-- Define the mapleader variable early in the configuration process. This is important
-- because some plugins might rely on it.
vim.g.mapleader = ","

-- Disable the built-in netrw and netrwPlugin in order to use a preferred file explorer plugin.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim, for managing and loading plugins lazily.
-- The setup checks for the existence of lazy.nvim. If it's not found, it clones the
-- latest stable version of lazy.nvim from GitHub.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("steve.plugins", {
  -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
  -- have outdated releases, which may break your Neovim install.
  defaults = {
    lazy = false,
    version = false,
  },
  -- automatically check and notify for plugin updates
  checker = {
    enabled = true,
    notify = true,
  },
  -- disable notifications when config file changes are found
  change_detection = {
    notify = false,
  },
})

-- Load the custom configuration modules for NeoVim options and keymaps.
-- 'steve.options' contains settings for various Vim options.
-- 'steve.keymaps' contains custom key mappings.
require("steve.options")
require("steve.keymaps")
require("steve.autocmds")
