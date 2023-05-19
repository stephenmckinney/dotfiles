local function map(m, k, v, d, s)
  if s == nil then s = true end
  vim.keymap.set(m, k, v, { noremap = true, desc = d, silent = s })
end

-- Maintain selection after indent
map('v', '>', '>gv', 'Indent (maintain selection)')
map('v', '<', '<gv', 'Outdent (maintain selection)')

--------------------------------------------------------------------------------
-- Windows
--------------------------------------------------------------------------------
-- Window navigation
map('n', '<C-j>', '<C-w>j', 'Move cursor to window below current one')
map('n', '<C-k>', '<C-w>k', 'Move cursor to window above current one')
map('n', '<C-l>', '<C-w>l', 'Move cursor to window left of current one')
map('n', '<C-h>', '<C-w>h', 'Move cursor to window right of current one')

-- Split windows
map('n', '<leader>v', '<C-w>v<C-w>l', 'Split window vertically')
map('n', '<leader>h', '<C-w>s<C-w>j', 'Split window horizontally')
map('n', '<leader>=', '<C-w>=', 'Adjust viewports to the same size')
map('n', '<leader>o', '<C-w>o', 'Close all but current window')

--------------------------------------------------------------------------------
-- Search
--------------------------------------------------------------------------------
map('n', '<cr>', ':noh<cr>', 'Stop highlighting search')

-- search prompt
map('n', '/', '/\\v', 'Search very-magically', false)
map('v', '/', '/\\v', 'Use search in visual mode', false)

-- Search and replace prompt
map('n', 's', ':%s/\\v/g<left><left>', 'Search and replace', false)
map('n', 'S', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', 'Search and replace the word under the cursor', false)
