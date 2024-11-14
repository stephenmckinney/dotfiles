-- While typing display a popup of possible keybindings
return {
  {
    "folke/which-key.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      local wk = require("which-key")

      wk.add({
        { "g", group = "goto" },
        { "gu", group = "textcase" },
        { "]", group = "next" },
        { "[", group = "prev" },
        { "<leader>c", group = "code" },
        { "<leader>h", group = "harpoon" },
        { "<leader>i", group = "info", icon = { cat = "extension", name = "info" } },
        { "<leader>iz", "<cmd>Lazy<cr>", desc = "La[z]y" },
        { "<leader>ih", "<cmd>checkhealth<cr>", desc = "Health" },
        { "<leader>e", group = "edit", icon = { cat = "extension", name = "txt" } },
        { "<leader>g", group = "git" },
        { "<leader>q", group = "diagnostics/quickfix" },
        { "<leader>s", group = "search" },
        { "<leader>x", group = "debug" },
        -- TODO: choose other keymaps for chatGPT
        { "<leader>z", desc = "+chatGPT" },
        -- ["<leader>t"] = { desc = "+test" },
        -- ["<leader>u"] = { desc = "+ui" },
      })
    end,
  },
}
