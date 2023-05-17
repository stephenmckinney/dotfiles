return {
  -- catppuccin
  {
    'catppuccin/nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('catppuccin').setup {
        flavor='macchiato',
      }
      vim.cmd([[colorscheme catppuccin]]) -- load colorscheme
    end
  },

  -- solarized
  {
    'Tsuzat/NeoSolarized.nvim',
    lazy = true,
    config = function()
      require('NeoSolarized').setup {
        style = 'dark',
        transparent = false,
        enable_italics = false,
        on_highlights = function(highlights, colors) 
          highlights.Visual.bg = colors.fg2
        end,
      }
    end
  },

  -- tokyo night
  {
    'folke/tokyonight.nvim',
    lazy = true,
  },
}
