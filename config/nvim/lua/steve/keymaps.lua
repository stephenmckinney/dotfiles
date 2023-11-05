--------------------------------------------------------------------------------
-- Keymaps
--
-- For key mappings used to lazy-load plugins, see /plugins/*
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------
-- Map keys with default options.
--
-- mode, lhs, rhs - see |nvim_set_keymap()|.
-- desc - Description of the mapping.
-- opts - An optional table of keymap options that will override the default options.
local function map(mode, lhs, rhs, desc, opts)
  local defaults = { noremap = true, desc = desc, silent = true }

  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", defaults, opts or {}))
end

--------------------------------------------------------------------------------
-- Basics
--------------------------------------------------------------------------------
-- Maintain selection after indent
map("v", ">", ">gv", "Indent (maintain selection)")
map("v", "<", "<gv", "Outdent (maintain selection)")

-- Up/down by display lines. If [count] e.g. 3j, then up/down linewise.
map("n", "j", "v:count == 0 ? 'gj' : 'j'", "up motion", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", "down motion", { expr = true })

-- Yank to clipboard
map("v", "gy", '"+y', "Yank to clipboard")

--------------------------------------------------------------------------------
-- Windows
--------------------------------------------------------------------------------
-- Window navigation
map("n", "<C-j>", "<C-w>j", "Move cursor to window below current one")
map("n", "<C-k>", "<C-w>k", "Move cursor to window above current one")
map("n", "<C-l>", "<C-w>l", "Move cursor to window left of current one")
map("n", "<C-h>", "<C-w>h", "Move cursor to window right of current one")
map("n", "<C-x>", "<C-w>x", "E[x]change current window with the next one")

-- Split windows
map("n", "<leader>v", "<C-w>v<C-w>l", "Split window vertically")
map("n", "<leader>h", "<C-w>s<C-w>j", "Split window horizontally")
map("n", "<leader>=", "<C-w>=", "Adjust viewports to the same size")
map("n", "<leader>o", "<C-w>o", "Close all but current window")

--------------------------------------------------------------------------------
-- Tabs
--------------------------------------------------------------------------------
vim.api.nvim_create_user_command("T", "tabnew", {})

--------------------------------------------------------------------------------
-- Search
--------------------------------------------------------------------------------
map("n", "<cr>", ":noh<cr>", "Stop highlighting search")

-- Search prompt
map("n", "/", "/\\v", "Search very-magically", { silent = false })
map("v", "/", "/\\v", "Use search in visual mode", { silent = false })

-- Search and replace (substitute) prompt
map("n", "gs", ":%s/\\v", "Go: substitute", { silent = false })
map("v", "gs", ":s/\\v", "Go: subsitute", { silent = false })
map("n", "gS", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", "Go: substitute, word under cursor", { silent = false })
