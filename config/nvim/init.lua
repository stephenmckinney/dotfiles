-- Define the mapleader variable early in the configuration process. This is important
-- because some plugins might rely on it.
vim.g.mapleader = ","

-- Disable the built-in netrw and netrwPlugin in order to use a preferred file explorer plugin.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Bootstrap lazy.nvim
-- Lazy.nvim manages and loads plugins lazily.
-- The setup checks for the existence of lazy.nvim. If it's not found, it clones the
-- latest stable version of lazy.nvim from GitHub.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "steve.plugins" },
    { import = "steve.plugins.editor" },
    { import = "steve.plugins.ide" },
  },
  -- disable config change notifications
  change_detection = {
    notify = false,
  },
  -- load colorscheme while installing new plugins during startup
  install = {
    colorscheme = { "default" },
  },
})

-- Load custom Neovim options, keymaps, and autocmds.
require("steve.options")
require("steve.keymaps")
require("steve.autocmds")
