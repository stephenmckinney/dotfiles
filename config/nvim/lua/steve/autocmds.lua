--------------------------------------------------------------------------------
-- Autocmds
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

-- Function to create and return a namespaced autocommand group,
-- with `clear = true` option to clear existing group with the same name
local function augroup(name)
  local namespace = "steve_"
  return vim.api.nvim_create_augroup(namespace .. name, { clear = true })
end

--------------------------------------------------------------------------------
-- autocmd
--------------------------------------------------------------------------------

-- If the current buffer's filetype is "fugitive"
-- then set the height of the current window to 2/3 of screen size.
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("fugitive"),
  callback = function()
    local lines = math.ceil(vim.opt.lines:get() * 2 / 3)
    if vim.bo.filetype == "fugitive" then
      vim.api.nvim_win_set_height(0, lines)
    end
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "fugitive",
    "help",
    "qf",
    "spectre_panel",
    "checkhealth",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Set local options for "text" files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("text_file_options"),
  pattern = { "gitcommit", "markdown", "text", "txt" },
  callback = function()
    -- wrap and check for spell
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    -- set indention
    vim.opt_local.sw = 2
    vim.opt_local.sts = 2
    vim.opt_local.ts = 2
  end,
})

-- Comment Continuation
--   Disable automatic comment continuation when:
--   * auto-wrapping a line
--   * after hitting <Enter> in Insert mode
--   * after hitting 'o' or 'O' in Normal mode
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("comment_continuation"),
  pattern = { "*" },
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})
