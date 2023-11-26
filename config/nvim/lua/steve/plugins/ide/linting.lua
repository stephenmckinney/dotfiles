local Util = require("steve.util")

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      sh = { "shellcheck" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = Util.augroup("nvim_lint"),
      pattern = { "*.js", "*.jsx", "*.sh", "*.ts", "*.tsx" },
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
