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
      { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "List open buffers" },
      -- quick grep
      { "<leader>a", "<cmd>Telescope live_grep<cr>", desc = "Search for a string (rg)" },
      {
        "<leader>f",
        function()
          require("telescope.builtin").grep_string({
            search = "",
            word_match = "-w",
            -- path_display = { "smart" },
            prompt_title = "Fuzzy Search (fzf)",
          })
        end,
        desc = "Fuzzy search for a string (fzf)",
      },
      {
        "<leader>F",
        function()
          require("telescope.builtin").grep_string({
            word_match = "-w",
            -- path_display = { "smart" },
          })
        end,
        desc = "Search for word/selection, then fuzzy search (rg -> fzf)",
      },
      -- resume
      { "<leader>S", "<cmd>Telescope resume<cr>", desc = "Lists the results incl. multi-selections of the previous picker" },
      -- 'search' leaders
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Lists vim autocommands and goes to their declaration on <cr>" },
      { "<leader>sc", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Live fuzzy search inside of the currently open buffer" },
      -- { "<leader>scm", "<cmd>Telescope commands<cr>", desc = "Lists available plugin/user commands and runs them on <cr>" },
      -- { "<leader>sch", "<cmd>Telescope command_history<cr>", desc = "Lists commands that were executed recently, and reruns them on <cr>" },
      { "<leader>sf", "<cmd>Telescope filetypes<cr>", desc = "Lists all available filetypes" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "List all available help tags" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Lists all available highlights" },
      { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Lists Jump List entries" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Lists normal mode keymappings" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Lists vim marks and their value" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Lists manpage entries, opens them in a help window on <cr>" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Lists vim options, allows you to edit the current value on <cr>" },
      { "<leader>sp", "<cmd>Telescope oldfiles<cr>", desc = "Lists previously open files" },
      { "<leader>ss", "<cmd>Telescope search_history<cr>", desc = "Lists searches that were executed recently, and reruns them on <cr>" },
      { "<leader>st", "<cmd>Telescope current_buffer_tags<cr>", desc = "Lists all of the tags for the currently open buffer, with a preview" },
      { "<leader>sT", "<cmd>Telescope tags<cr>", desc = "Lists tags in current directory with tag location file preview (run ctags -R)" },
      -- git
      { "<leader>gl", "<cmd>Telescope git_bcommits<CR>", desc = "git log on current buffer (telescope)" },
      { "<leader>gL", "<cmd>Telescope git_commits<CR>", desc = "git log on current directory (telescope)" },
      { "<leader>gS", "<cmd>Telescope git_status<CR>", desc = "git status (telescope)" },
      -- Meh?
      -- { "<leader>foo", "<cmd>Telescope loclist<cr>", desc = "Lists items from the current window's location list" },
      -- { "<leader>foo", "<cmd>Telescope pickers<cr>", desc = "Lists the previous pickers incl. multi-selections (see :h telescope.defaults.cache_picker)" },
      -- { "<leader>foo", "<cmd>Telescope quickfix<cr>", desc = "Lists items in the quickfix list" },
      -- { "<leader>foo", "<cmd>Telescope quickfixhistory<cr>", desc = "Lists all quickfix lists in your history and open them with builtin.quickfix or quickfix window" },
      -- { "<leader>foo", "<cmd>Telescope registers<cr>", desc = "Lists vim registers, pastes the contents of the register on <cr>" },
      -- { "<leader>foo", "<cmd>Telescope spell_suggest<cr>", desc = "Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on <cr>" },
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
      })
    end,
    keys = {
      -- Search and Replace all files in current directory
      { "<leader>sr", '<cmd>lua require("spectre").open()<CR>', desc = "Open Search and Replace (Spectre)" },
      { "<leader>sR", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search and Replace word under cursor (Spectre)" },
      { "<leader>sR", '<esc><cmd>lua require("spectre").open_visual()<CR>', mode = "x", desc = "Search and Replace current selection (Spectre)" },
      -- Search and Replace on current file
      { "<leader>sb", '<cmd>lua require("spectre").open_file_search()<CR>', desc = "Search and Replace on current file (Spectre)" },
      { "<leader>sB", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search and Replace word under cursor on current file (Spectre)" },
    },
  },
}
