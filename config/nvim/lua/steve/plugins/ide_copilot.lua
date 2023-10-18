-- copilot
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    config = function()
      require("copilot").setup({
        -- disable suggestion and panel modules, so that they can't interfere with completions properly appearing in copilot-cmp
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          javascript = true,
          ruby = true,
          typescript = true,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
