local opts = { noremap = true, silent = true }

-- Maintain selection after indent
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)
