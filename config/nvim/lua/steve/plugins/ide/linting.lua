return {
  "mfussenegger/nvim-lint",
  event = { "BufWritePre" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- javascript = { "eslint" },
    }

    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   group = vim.api.nvim_create_augroup("steve_nvim_lint", { clear = true }),
    --   callback = function()
    --     lint.try_lint()
    --   end,
    -- })
  end,
}
