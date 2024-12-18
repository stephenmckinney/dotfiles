--------------------------------------------------------------------------------
-- Options
--
-- Vim has a number of internal variables and switches which can be set to
-- achieve special effects.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- User Interface
--  Display relative line numbers, line numbers, and cursor line
--  Highlight matching parentheses/brackets.
--------------------------------------------------------------------------------
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cursorline = true -- Highlight the text line of the cursor
vim.opt.showmatch = true -- Highlight matching brackets on input
vim.opt.mouse = "" -- Disable mouse support

--------------------------------------------------------------------------------
-- Indentation
--  Use soft tabs (spaces instead of tabs).
--  Set indentation to 2 spaces.
--------------------------------------------------------------------------------
vim.opt.tabstop = 2 -- Each tab character is equivalent to 2 spaces
vim.opt.softtabstop = 2 -- A tab or backspace inserts/deletes 2 spaces
vim.opt.shiftwidth = 2 -- Indent/outdent by 2 spaces
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- New lines inherit indentation of previous line

--------------------------------------------------------------------------------
-- Wrap and Scroll
--  Avoid wrapping long lines.
--  Maintain a margin of 8 lines from top/bottom and 15 columns from left/right.
--------------------------------------------------------------------------------
vim.opt.wrap = false -- Disable line wrapping
vim.opt.scrolloff = 8 -- Keep at least 8 lines visible above/below the cursor
vim.opt.sidescrolloff = 15 -- Keep at least 15 columns visible left/right of the cursor

--------------------------------------------------------------------------------
-- Folding
--  Use indentation to determine folds, but keep them open by default.
--------------------------------------------------------------------------------
vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.foldcolumn = "4" -- Display folds in sidebar
-- folding with treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--------------------------------------------------------------------------------
-- Undo
-- Keep a history of up to 1000 changes that persist even after closing and
-- reopening Vim.
-- This state data is stored in the session state directory ~/.local/state/nvim/
--------------------------------------------------------------------------------
vim.opt.undofile = true -- Enable persistent undo history
vim.opt.undolevels = 1000 -- Maximum number of changes that can be undone
vim.opt.undoreload = 10000 -- Maximum number of lines to save for undo on a buffer reload

--------------------------------------------------------------------------------
-- Splits
--  Open vertical splits to the right and balance their sizes automatically.
--------------------------------------------------------------------------------
vim.opt.splitright = true -- Open vertical splits to the right of the current window
vim.opt.equalalways = true -- Always balance window sizes when opening/closing windows

--------------------------------------------------------------------------------
-- Search
--  Make search case-insensitive by default, but case-sensitive if the pattern
--  contains uppercase letters.
--------------------------------------------------------------------------------
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true -- Make search case-sensitive if pattern contains uppercase letters

--------------------------------------------------------------------------------
-- Command-line completion
--  "list:longest", first list all matching completions and select the longest
--  common part. After pressing the Tab key again, "list:full", list all
--  matching completions and select the first one in the list.
--------------------------------------------------------------------------------
vim.opt.wildmode = "list:longest,list:full"
