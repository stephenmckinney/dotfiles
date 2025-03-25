return {
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "InsertEnter", -- Auto completion is triggered when insert mode is entered.
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_no_maps = true

      -- Suggest
      -- vim.keymap.set("i", "<C-h>", "<Plug>(copilot-suggest)") -- Trigger suggestion - "help me suggest"

      -- Suggestion navigation
      vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)") -- Next suggestion
      vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)") -- Previous suggestion

      -- Accepting suggestions
      vim.keymap.set("i", "<C-k>", 'copilot#Accept("\\<CR>")', { -- Accept whole suggestion - most common action gets another home row key
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set("i", "<C-f>", "<Plug>(copilot-accept-word)") -- Accept word
      vim.keymap.set("i", "<C-l>", "<Plug>(copilot-accept-line)") -- Accept line

      -- Dismissing
      vim.keymap.set("i", "<C-c>", "<Cmd>call copilot#Dismiss()<CR>") -- Dismiss - "cancel"
    end,
    keys = {
      { "<leader>ip", "<cmd>Copilot status<cr>", desc = "Co[p]ilot Status" },
    },
  },
}
