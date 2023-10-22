return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("steve_nvim_lint", { clear = true }),
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
