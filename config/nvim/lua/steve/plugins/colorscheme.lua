--------------------------------------------------------------------------------
-- Colorschemes
--
-- The configuration for colorschemes adheres to the following principles:
-- * Each theme must be written in Lua for compatibility and performance.
-- * Each theme must support treesitter for syntax highlighting.
-- * Each theme must support lualine for statusline customization.
-- * Each theme must include itermcolors for consistency across terminal sessions.
--------------------------------------------------------------------------------
return {
  -- Catppuccin
  -- A visually soothing coffee-themed colorscheme.
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- Available flavors: catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
      -- vim.cmd("colorscheme catppuccin-macchiato")
    end,
  },

  -- Tokyo Night
  -- A clean, dark theme inspired by Tokyo at night.
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    config = function()
      require("tokyonight").setup({
        -- Available styles: storm, moon, night, day
        style = "storm",
      })
      -- vim.cmd("colorscheme tokyonight")
    end,
  },

  -- Nightfox
  -- A dark colorscheme with vibrant pops of color.
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    lazy = false, -- If this is your main colorscheme, set to false to load during startup.
    priority = 1000, -- Ensure this plugin loads before all other start plugins.
    config = function()
      require("nightfox").setup({})
      vim.cmd("colorscheme terafox") -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
    end,
  },

  -- Rose Pine
  -- Soft pastel themes inspired by a peaceful forest.
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        -- Available variants: auto, main, moon, dawn
        variant = "auto",
        dark_variant = "moon",
      })
      -- vim.cmd("colorscheme rose-pine")
    end,
  },

  -- One Nord
  -- Combines the Nord and Atom One Dark color palettes to add more vibrance to the Nord theme.
  {
    "rmehri01/onenord.nvim",
    name = "openord",
    config = function()
      -- require("onenord").setup({})
      -- vim.cmd("colorscheme onenord")
    end,
  },

  -- Nord
  -- Dimmed pastel themes for a eye-comfortable, but yet colorful ambiance.
  -- Note: No itermcolors, but similar to onenord.
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_cursorline_transparent = true
      vim.g.nord_uniform_diff_background = true

      -- Load the colorscheme
      -- require("nord").set()
      -- vim.cmd("colorscheme nord")
    end,
  },

  -- One Dark
  -- Combines the Nord and Atom One Dark color palettes to add more vibrance to the Nord theme.
  -- Note: No itermcolors, but similar to onenord.
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    config = function()
      require("onedark").setup({
        -- Available styles: dark, darker, cool, deep, warm, warmer, light
        style = "cool",
      })
      -- vim.cmd("colorscheme onedark")
    end,
  },

  -- Material
  -- Material Design look and feel.
  {
    "marko-cerovac/material.nvim",
    name = "material",
    config = function()
      -- Available themes: default, palenight, ocean, lighter, darker, default-community, palenight-community, ocean-community, lighter-community, darker-community
      vim.g.material_theme_style = "ocean"
      -- vim.cmd("colorscheme material")
    end,
  },
}
