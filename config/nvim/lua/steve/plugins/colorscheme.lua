--------------------------------------------------------------------------------
-- Colorschemes
--
-- The configuration for colorschemes adheres to the following principles:
-- * Each theme must be written in Lua for compatibility and performance.
-- * Each theme must support treesitter for syntax highlighting.
-- * Each theme must support lualine for statusline customization.
-- * Each theme must include itermcolors for consistency across terminal sessions.
--------------------------------------------------------------------------------
local colorschemes = {
  -- Catppuccin
  -- A visually soothing coffee-themed colorscheme.
  -- Available flavors: catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      background = {
        integrations = {
          cmp = true,
          gitsigns = true,
          mason = true,
          neotest = true,
          notify = false,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
        },
      },
    },
  },

  -- Tokyo Night
  -- A clean, dark theme inspired by Tokyo at night.
  -- Available styles: storm, moon, night, day
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    opts = {
      style = "night",
      sidebars = { "qf", "help", "NvimTree", "neotest-summary" },
    },
  },

  -- Nightfox
  -- A dark colorscheme with vibrant pops of color.
  -- Available flavors: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
  -- vim.cmd("colorscheme terafox")
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    opts = {
      groups = {
        all = {
          TelescopeBorder = { fg = "palette.fg3" },
        },
      },
    },
  },

  -- Rose Pine
  -- Soft pastel themes inspired by a peaceful forest.
  -- Available variants: auto, main, moon, dawn
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "auto",
      dark_variant = "main",
    },
  },

  -- One Nord
  -- Combines the Nord and Atom One Dark color palettes to add more vibrance to the Nord theme.
  {
    "rmehri01/onenord.nvim",
    name = "openord",
    config = true,
  },

  -- Nord
  -- A dimmed pastel theme that provides an eye-comfortable, yet colorful ambiance.
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_cursorline_transparent = true
      vim.g.nord_uniform_diff_background = true

      -- require("nord").set()
    end,
  },

  -- Material
  -- Material Design theme that gives your Neovim a modern, clean aesthetic.
  -- Available themes: default, palenight, ocean, lighter, darker, default-community, palenight-community, ocean-community, lighter-community, darker-community
  {
    "marko-cerovac/material.nvim",
    name = "material",
    config = function()
      vim.g.material_theme_style = "ocean"
    end,
  },

  -- One Dark
  -- This theme combines the Nord and Atom One Dark color palettes to add more vibrance to the Nord theme.
  -- It doesn't have itermcolors, but it's similar to onenord.
  -- Available styles: dark, darker, cool, deep, warm, warmer, light
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    opts = {
      style = "cool",
    },
  },
}

-- Set all colorschemes to lazy-load on key map for builtin.colorscheme picker, so that they can be hotswapped.
-- Unless the name key is our main colorscheme.
for _, entry in ipairs(colorschemes) do
  if entry.name == "tokyonight" then
    entry.lazy = false -- If this is your main colorscheme, set to false to load during startup.
    entry.priority = 1000 -- Ensure this plugin loads before all other start plugins.
  else
    entry.lazy = true
    entry.keys = {
      { "<leader>sc", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "List colorschemes, apply them on <cr>" },
    }
  end
end

return colorschemes
