local function map(mode, lhs, rhs, desc, overrides)
  local opts = { noremap = true, desc = desc, silent = true }
  overrides = overrides or {}
  for k, v in pairs(overrides) do
    opts[k] = v
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Maintain selection after indent
map("v", ">", ">gv", "Indent (maintain selection)")
map("v", "<", "<gv", "Outdent (maintain selection)")

-- Up/down by display lines. If [count] e.g. 3j, then up/down linewise.
map("n", "j", "v:count == 0 ? 'gj' : 'j'", "up motion", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", "down motion", { expr = true })

--------------------------------------------------------------------------------
-- Windows
--------------------------------------------------------------------------------
-- Window navigation
map("n", "<C-j>", "<C-w>j", "Move cursor to window below current one")
map("n", "<C-k>", "<C-w>k", "Move cursor to window above current one")
map("n", "<C-l>", "<C-w>l", "Move cursor to window left of current one")
map("n", "<C-h>", "<C-w>h", "Move cursor to window right of current one")

-- Split windows
map("n", "<leader>v", "<C-w>v<C-w>l", "Split window vertically")
map("n", "<leader>h", "<C-w>s<C-w>j", "Split window horizontally")
map("n", "<leader>=", "<C-w>=", "Adjust viewports to the same size")
map("n", "<leader>o", "<C-w>o", "Close all but current window")

--------------------------------------------------------------------------------
-- Search
--------------------------------------------------------------------------------
map("n", "<cr>", ":noh<cr>", "Stop highlighting search")

-- search prompt
map("n", "/", "/\\v", "Search very-magically", { silent = false })
map("v", "/", "/\\v", "Use search in visual mode", { silent = false })

-- Search and replace (substitute) prompt. Quick search and replace 'q' vs Spectre and Telescope 's'
-- stylua: ignore start
map(
  "n",
  "gs",
  ":%s/\\v/g<left><left>",
  "Search and replace (vim substitute)",
  { silent = false }
)
map(
  "n",
  "gS",
  ":%s/\\<<C-r><C-w>\\>//g<Left><Left>",
  "Search and replace word under cursor (vim substitute)",
  { silent = false }
)
