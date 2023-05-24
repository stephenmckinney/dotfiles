--------------------------------------------------------------------------------
-- Editor
--
-- Requirements:
-- * File explorer
-- * Fuzzy finder
-- * Search and replace
--------------------------------------------------------------------------------
return {

  -- File Explorer
  -- The nvim-tree plugin provides a sidebar for browsing the file system.
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    config = function()
      require("nvim-tree").setup({})
    end,
    keys = {
      { "<leader>d", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
      { "<leader>D", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file in File Explorer" },
    },
  },

  -- Fuzzy Finder
  -- Telescope is a highly customizable fuzzy finder plugin that helps to locate files, buffers, or lines of code.
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
    end,
    keys = {
      -- quick find
      { "<leader>t", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Find open buffers" },
      -- quick grep
      { "<leader>a", "<cmd>Telescope live_grep<cr>", desc = "Search for a string" },
      { "<leader>A", "<cmd>Telescope grep_string<cr>", desc = "Search for word under cursor or selection" },
      -- 'search' leaders
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Lists vim autocommands and goes to their declaration on <cr>" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Live fuzzy search inside of the currently open buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Lists commands that were executed recently, and reruns them on <cr>" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Lists available plugin/user commands and runs them on <cr>" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find help tags" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Lists normal mode keymappings" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Lists vim marks and their value" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Lists manpage entries, opens them in a help window on <cr>" },
      { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Lists previously open files" },
      { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Lists the results incl. multi-selections of the previous picker" },
      { "<leader>ss", "<cmd>Telescope search_history<cr>", desc = "Lists searches that were executed recently, and reruns them on <cr>" },
      -- search vim
      { "<leader>svh", "<cmd>Telescope highlights<cr>", desc = "Lists all available highlights" },
      { "<leader>svo", "<cmd>Telescope vim_options<cr>", desc = "Lists vim options, allows you to edit the current value on <cr>" },
      { "<leader>svf", "<cmd>Telescope filetypes<cr>", desc = "Lists all available filetypes" },
      -- git
      { "<leader>gl", "<cmd>Telescope git_commits<CR>", desc = "git log" },
      { "<leader>gS", "<cmd>Telescope git_status<CR>", desc = "git status (telescope)" },
    },
  },

  -- Search/Replace in Multiple Files
  -- nvim-spectre provides powerful search and replace capabilities across multiple files.
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup({
        highlight = {
          replace = "@text.warning",
        },
        mapping = {
          ["run_current_replace"] = {
            map = "<leader>r",
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = "replace current line",
          },
          ["run_replace"] = {
            map = "<leader>R",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all",
          },
        },
      })
    end,
    keys = {
      { "<leader>r", '<cmd>lua require("spectre").open()<CR>', desc = "Open Search and Replace (Spectre)" },
      { "<leader>rw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search and Replace word under cursor (Spectre)" },
      { "<leader>rb", '<esc><cmd>lua require("spectre").open_visual()<CR>', mode = "x", desc = "Search and Replace current selection (Spectre)" },
      { "<leader>rc", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search and Replace on current file (Spectre)" },
    },
  },
}
