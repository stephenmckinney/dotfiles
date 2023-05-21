--------------------------------------------------------------------------------
-- Colorschemes
--
-- All themes must:
-- * be written in Lua
-- * support treesitter
-- * support lualine
-- * include itermcolors
--------------------------------------------------------------------------------
return {
  -- catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true, -- set to false to load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('catppuccin').setup {}
      vim.cmd('colorscheme catppuccin-macchiato') -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

    end,
  },

  -- tokyo night
  {
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    lazy = true, -- set to false to load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('tokyonight').setup {
        style = 'storm' -- storm, moon, night, day
      }
      vim.cmd('colorscheme tokyonight')
    end,
  },

  -- nightfox
  {
    'EdenEast/nightfox.nvim',
    name = 'nightfox',
    lazy = false, -- set to false to load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('nightfox').setup {}
      vim.cmd('colorscheme terafox') -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
    end,
  },

  -- rose-pine
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = true, -- set to false to load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('rose-pine').setup {
        variant = 'moon', --- auto, main, moon, dawn
      }
      vim.cmd('colorscheme rose-pine')
    end,
  },
}
