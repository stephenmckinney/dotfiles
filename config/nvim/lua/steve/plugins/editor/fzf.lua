-- Fuzzy Finder
-- New, improved fzf.vim written in lua
return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      "telescope",
      winopts = {
        width = 0.85,
        height = 0.9,
        preview = {
          vertical = "up:50%",
          horizontal = "right:45%",
        },
      },
    },
    -- stylua: ignore
    keys = {
      -- Set <c-j> and <c-k>, up and down, to not wait for the next key
      { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
      { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
      --- Files
      { "<leader>t", "<cmd>FzfLua files<cr>", desc = "Find Files (Root Dir)" },
      -- Buffers
      { "<leader>b", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Switch Buffer" },
      -- Greps
      { "<leader>f", "<cmd>FzfLua grep project<cr>", desc = "Fzf Search (Root Dir)" },
      { "<leader>F", "<cmd>FzfLua grep_cword<cr>", desc = "Grep Word Under Cursor (Root Dir)" },
      { "<leader>F", "<cmd>FzfLua grep_visual<cr>", mode = "v", desc = "Grep Seleted Word (Root Dir)" },
      -- Ag/Rg then Fzf
      { "<leader>a", "<cmd>FzfLua live_grep<cr>", desc = "Grep -> Fzf (Root Dir)" },

      -- git
      { "<leader>gl", "<cmd>FzfLua git_bcommits<CR>", desc = "`git log` on current buffer" },
      { "<leader>gL", "<cmd>FzfLua git_commits<CR>", desc = "`git log` on current directory" },
      { "<leader>gS", "<cmd>FzfLua git_status<CR>", desc = "`git status`" },

      -- Resume
      { "<leader>S", "<cmd>FzfLua resume<cr>", desc = "Resume" },

      -- "Search" keys
      { "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Search the Buffer" },
      { "<leader>sx", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
      { "<leader>sX", "<cmd>FzfLua commands<cr>", desc = "Commands" },
      { "<leader>sc", "<cmd>FzfLua colorschemes<cr>", desc = "Colorscheme with Preview" },
      { "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
      { "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
      { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Highlight Groups" },
      { "<leader>sj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
      { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
      { "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
      { "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" },
      { "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
      { "<leader>sq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
      { "<leader>sr", "<cmd>FzfLua registers<cr>", desc = "Registers" },
      { "<leader>st", "<cmd>FzfLua btags<cr>", desc = "Tags (Current Buffer)" },
      { "<leader>sT", "<cmd>FzfLua tags<cr>", desc = "Tags" },
      -- TODO: Add lsp keys
    },
  },
}
