--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

local M = {}

-- Function to create and return a namespaced autocommand group,
-- with `clear = true` option to clear existing group with the same name
function M.augroup(name)
  local namespace = "steve_"
  return vim.api.nvim_create_augroup(namespace .. name, { clear = true })
end

return M
