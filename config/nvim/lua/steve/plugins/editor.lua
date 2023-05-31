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
      require("nvim-tree").setup({
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")

          -- Key mapping options
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- Key mappings
          vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
          vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
          vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
          vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
          vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
          vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
          vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
          vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
          vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
          vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
          vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
          vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
          vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
          vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
          vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
          vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
          vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
          vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
          vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
          vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
          vim.keymap.set("n", "a", api.fs.create, opts("Create"))
          vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
          vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
          vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
          vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
          vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
          vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
          vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
          vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
          vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
          vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
          vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
          vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
        end,
      })
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

      -- Set letters that match search to a bright color
      vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Number" })
    end,
    -- stylua: ignore
    keys = {
      -- find
      { "<leader>t", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>b", "<cmd>Telescope buffers sort_lastused=true ignore_current_buffer=true<cr>", desc = "List open buffers" },
      -- grep
      { "<leader>a", "<cmd>Telescope live_grep<cr>", desc = "Search for a string (rg)" },
      -- fuzzy search
      {
        -- No: path_display = { "smart" }, because path display will not be uniform
        -- Yes: only_sort_text = true,
        --   Pro: e.g. search for "editor", will not prioritize files named "editor.lua"
        --   Con: you can no longer exclude by filename e.g. "editor !json"
        "<leader>f",
        function()
          require("telescope.builtin").grep_string({
            search = "",
            word_match = "-w",
            only_sort_text = true,
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
          })
        end,
        desc = "Search for word/selection, then fuzzy search (rg -> fzf)",
      },
      -- resume
      { "<leader>S", "<cmd>Telescope resume<cr>",                     desc = "Resume previous picker" },
      -- 'search' leaders
      { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "List autocommands, go to their declaration on <cr>" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy search currently open buffer" },
      { "<leader>sf", "<cmd>Telescope filetypes<cr>",                 desc = "List filetypes" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",                 desc = "List help tags" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>",                desc = "List highlights" },
      { "<leader>sj", "<cmd>Telescope jumplist<cr>",                  desc = "List jumplist" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",                   desc = "List keymappings, for normal mode" },
      { "<leader>sm", "<cmd>Telescope marks<cr>",                     desc = "List marks, and their value" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",                 desc = "List manpage entries, open them in a help window on <cr>" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "List Vim options, allows you to edit the current value on <cr>" },
      { "<leader>sp", "<cmd>Telescope oldfiles<cr>",                  desc = "List previously open files" },
      { "<leader>ss", "<cmd>Telescope search_history<cr>",            desc = "List searches that were executed recently, and reruns them on <cr>" },
      { "<leader>st", "<cmd>Telescope current_buffer_tags<cr>",       desc = "List tags for the currently open buffer, with a preview" },
      { "<leader>sT", "<cmd>Telescope tags<cr>",                      desc = "List tags in current directory with tag location file preview (run ctags -R)" },
      { "<leader>sx", "<cmd>Telescope commands<cr>",                  desc = "List commands, available plugin/user cmds and runs them on <cr>" },
      { "<leader>sX", "<cmd>Telescope command_history<cr>",           desc = "List command history, executed recently and reruns them on <cr>" },
      {
        "<leader>sv",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("$HOME/.dotfiles/config/nvim/"),
          })
        end,
        desc = "Find nvim config files",
      },
      -- git
      { "<leader>gl", "<cmd>Telescope git_bcommits<CR>", desc = "`git log` on current buffer (Telescope)" },
      { "<leader>gL", "<cmd>Telescope git_commits<CR>",  desc = "`git log` on current directory (Telescope)" },
      { "<leader>gS", "<cmd>Telescope git_status<CR>",   desc = "`git status` (Telescope)" },
      -- Meh?
      -- { "<leader>sl", "<cmd>Telescope loclist<cr>",         desc = "Lists items from the current window's location list" },
      -- { "<leader>sp", "<cmd>Telescope pickers<cr>",         desc = "Lists the previous pickers incl. multi-selections (see :h telescope.defaults.cache_picker)" },
      -- { "<leader>sq", "<cmd>Telescope quickfix<cr>",        desc = "Lists items in the quickfix list" },
      -- { "<leader>sq", "<cmd>Telescope quickfixhistory<cr>", desc = "Lists all quickfix lists in your history and open them with builtin.quickfix or quickfix window" },
      -- { "<leader>sr", "<cmd>Telescope registers<cr>",       desc = "Lists vim registers, pastes the contents of the register on <cr>" },
      -- { "<leader>ss", "<cmd>Telescope spell_suggest<cr>",   desc = "Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on <cr>" },
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
    -- stylua: ignore
    keys = {
      -- Search and Replace all files in current directory
      { "<leader>sr", '<cmd>lua require("spectre").open()<CR>',                               desc = "Open Search and Replace (Spectre)" },
      { "<leader>sR", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',      desc = "Search and Replace word under cursor (Spectre)" },
      { "<leader>sR", '<esc><cmd>lua require("spectre").open_visual()<CR>', mode = "x",       desc = "Search and Replace current selection (Spectre)" },
      -- Search and Replace on current file
      { "<leader>sb", '<cmd>lua require("spectre").open_file_search()<CR>',                   desc = "Search and Replace on current file (Spectre)" },
      { "<leader>sB", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search and Replace word under cursor on current file (Spectre)" },
    },
  },
}
