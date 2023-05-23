--------------------------------------------------------------------------------
-- Autocmds
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------
local autocmd_group_namespace = "Steve"

-- Function to create and return a namespaced autocommand group,
-- with `clear = true` option to clear existing group with the same name
local function create_group(name)
  local groupname = autocmd_group_namespace .. name
  return vim.api.nvim_create_augroup(groupname, { clear = true })
end

--------------------------------------------------------------------------------
-- autocmd
--------------------------------------------------------------------------------

local fugitive = create_group("Fugitive")
-- If the current buffer's filetype is "fugitive"
-- then set the height of the current window to 2/3 of screen size.
vim.api.nvim_create_autocmd("BufEnter", {
  group = fugitive,
  callback = function()
    local lines = vim.opt.lines:get() * 2 / 3
    if vim.bo.filetype == "fugitive" then
      vim.api.nvim_win_set_height(0, lines)
    end
  end,
})
