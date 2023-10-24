-- While typing display a popup of possible keybindings
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      local wk = require("which-key")

      wk.setup({
        triggers_blacklist = {
          n = { "'" },
        },
      })

      wk.register({
        ["g"] = { name = "+goto" },
        ["gu"] = { name = "+textcase" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>i"] = { name = "+info" },
        ["<leader>iz"] = { "<cmd>Lazy<cr>", "La[z]y" },
        ["<leader>ih"] = { "<cmd>Checkhealth<cr>", "Health" },
        ["<leader>e"] = { name = "+edit" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>x"] = { name = "+debug" },
        -- TODO: choose other keymaps for chatGPT
        ["<leader>z"] = { name = "+chatGPT" },
        -- ["<leader>r"] = { name = "+diagnostics/quickfix" },
        -- ["<leader>t"] = { name = "+test" },

        -- ["<leader>u"] = { name = "+ui" },
      })
    end,
  },
}
