-- Fuzzy Finder
-- Telescope is a highly customizable fuzzy finder plugin that helps to locate files, buffers, or lines of code.
return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = {
      -- This plugin allows Telescope to use the fzf fuzzy finder.
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    config = function()
      -- Fixes a bug where folds don't work when a file is opened in Telescope
      -- This issue has been discussed at https://github.com/nvim-treesitter/nvim-treesitter/issues/4754
      local function stopinsert(callback)
        return function(prompt_bufnr)
          vim.cmd.stopinsert()
          vim.schedule(function()
            callback(prompt_bufnr)
          end)
        end
      end
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = stopinsert(actions.select_default),
              ["<C-x>"] = stopinsert(actions.select_horizontal),
              ["<C-v>"] = stopinsert(actions.select_vertical),
              ["<C-t>"] = stopinsert(actions.select_tab),
            },
          },
        },
      })
      require("telescope").load_extension("fzf")

      -- Set letters that match search to a bright color
      -- Colorscheme tweak for nightfox
      -- vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Number" })
    end,
    -- stylua: ignore
    keys = {
      {
        "<leader>sd",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("$HOME/.dotfiles/"),
          })
        end,
        desc = "Find dotfiles",
      },
      { "<leader>sf", "<cmd>Telescope filetypes<cr>",                 desc = "List filetypes" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "List Vim options, allows you to edit the current value on <cr>" },
      { "<leader>sp", "<cmd>Telescope oldfiles<cr>",                  desc = "List previously open files" },
      { "<leader>ss", "<cmd>Telescope search_history<cr>",            desc = "List searches that were executed recently, and reruns them on <cr>" },
      {
        "<leader>sv",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("$HOME/.dotfiles/config/nvim/"),
          })
        end,
        desc = "Find nvim config files",
      },
    },
  },
}
