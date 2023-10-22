-- File Explorer
-- The nvim-tree plugin provides a sidebar for browsing the file system.
return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    config = function()
      require("nvim-tree").setup({
        on_attach = function(bufnr)
          -- Key mapping options
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          local api = require("nvim-tree.api")
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
      -- edit nvim config files
      {
        "<leader>ev",
        function()
          vim.cmd("tabnew")
          vim.cmd("NvimTreeOpen ~/.dotfiles/config/nvim/")
        end,
        desc = "Edt nvim config files",
      },
      -- edit dotfiles
      {
        "<leader>ed",
        function()
          vim.cmd("tabnew")
          vim.cmd("NvimTreeOpen ~/.dotfiles/")
        end,
        desc = "Edit dotfiles",
      },
      -- edit gitconfig
      {
        "<leader>eg",
        function()
          vim.cmd("tabnew")
          vim.cmd("e ~/.gitconfig")
          vim.cmd("vsplit")
          vim.cmd("e ~/.gitconfig-work")
        end,
        desc = "Edit gitconfig",
      },
      -- edit tmux config
      {
        "<leader>et",
        function()
          vim.cmd("tabnew")
          vim.cmd("e ~/.tmux.conf")
        end,
        desc = "Edit tmux config",
      },
    },
  },
}
