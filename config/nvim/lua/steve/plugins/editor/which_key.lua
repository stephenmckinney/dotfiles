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
        { "g", desc = "+goto" },
        { "gu", desc = "+textcase" },
        { "]", desc = "+next" },
        { "[", desc = "+prev" },
        { "<leader>c", desc = "+code" },
        { "<leader>h", desc = "+harpoon" },
        { "<leader>i", desc = "+info" },
        { "<leader>iz", "<cmd>Lazy<cr>", desc = "La[z]y" },
        { "<leader>ih", "<cmd>checkhealth<cr>", desc = "Health" },
        { "<leader>e", desc = "+edit" },
        { "<leader>g", desc = "+git" },
        { "<leader>q", desc = "+diagnostics/quickfix" },
        { "<leader>s", desc = "+search" },
        { "<leader>x", desc = "+debug" },
        -- TODO: choose other keymaps for chatGPT
        { "<leader>z", desc = "+chatGPT" },
        -- ["<leader>t"] = { desc = "+test" },

        -- ["<leader>u"] = { desc = "+ui" },
      })
    end,
  },
}
