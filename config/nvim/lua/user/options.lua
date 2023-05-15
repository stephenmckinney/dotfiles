-- Set mapleader before plugins are required, otherwise wrong leader will be used
vim.g.mapleader = ','

--------------------------------------------------------------------------------
--UI
--  Dispaly line numbers and matching parans/brackets.
--------------------------------------------------------------------------------
vim.opt.number=true -- Display line numbers
vim.opt.showmatch=true -- When a bracket is inserted, briefly jump to the match

--------------------------------------------------------------------------------
-- Indentation
--  Soft tabs, 2 spaces, and auto-indent.
--------------------------------------------------------------------------------
vim.opt.tabstop=2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop=2 -- Number of spaces <Tab> or <BS> counts while editing
vim.opt.shiftwidth=2 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab=true -- In Insert mode: Use spaces to insert a <Tab>
vim.opt.autoindent=true -- Copy indent from current line when starting a new line

--------------------------------------------------------------------------------
-- Wrap and Scroll
--  Don't wrap long lines.
--  Keep the cursor 8 lines from the top/bottom and 15 cols from the left/right.
--------------------------------------------------------------------------------
vim.opt.wrap=false
vim.opt.scrolloff=8
vim.opt.sidescrolloff=15

--------------------------------------------------------------------------------
-- Folding
--  Fold based on indent but don't enable it on load.
--------------------------------------------------------------------------------
vim.opt.foldmethod='indent'
vim.opt.foldenable=false

--------------------------------------------------------------------------------
-- Undo
--  Persist up to 1K chnages, even on reload, in a consistent directory.
--------------------------------------------------------------------------------
-- undo file, containing the undo trees of the file edited
-- swap file, containing the unsaved changes
-- backup file, make a backup before overwriting a file
vim.opt.undofile=true
vim.opt.undolevels=1000  -- Max number of changes that can be undone
vim.opt.undoreload=10000 -- Max number lines to save for undo on a buffer reload
vim.opt.undodir='~/.config/nvim/undo'
vim.opt.directory='~/.config/nvim/swp'
vim.opt.backupdir='~/.config/nvim/backup'

-----------------------------------------------------------------------
-- Splits
--  Open vertical splits to the right and automatically make them the same size
-----------------------------------------------------------------------
vim.opt.splitright=true
vim.opt.equalalways=true

-----------------------------------------------------------------------
-- Search
--  Ignore case in search patterns, but override the 'ignorecase' option if the search
--  pattern contains uppercase characters
-----------------------------------------------------------------------
vim.opt.ignorecase=true
vim.opt.smartcase=true
