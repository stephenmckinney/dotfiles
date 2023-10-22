return {
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter", -- Auto completion is triggered when insert mode is entered.
    config = function()
      vim.g.copilot_no_maps = true
      vim.g.copilot_no_tab_map = true

      vim.api.nvim_set_keymap("i", "<C-k>", [[copilot#Accept("\<CR>")]], { silent = true, expr = true, script = true })
      vim.api.nvim_set_keymap("i", "<C-j>", [[copilot#Dismiss()]], { silent = true, expr = true, script = true })
      vim.api.nvim_set_keymap("i", "<C-u>", [[copilot#Previous()]], { silent = true, expr = true, script = true })
      vim.api.nvim_set_keymap("i", "<C-d>", [[copilot#Next()]], { silent = true, expr = true, script = true })
      -- TODO: do we really need this if copilot is always active?
      -- vim.api.nvim_set_keymap("i", "<C-Space>", [[copilot#Suggest()]], { silent = true, expr = true, script = true })
    end,
    keys = {
      { "<leader>ip", "<cmd>Copilot status<cr>", desc = "Co[p]ilot Status" },
    },
  },
}
