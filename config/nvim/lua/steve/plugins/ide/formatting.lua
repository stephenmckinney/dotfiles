return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        ["css"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
        ["html"] = { "prettier" },
        ["javascript"] = { "prettier" },
        ["javascriptreact"] = { "prettier" },
        ["json"] = { "prettier" },
        ["jsonc"] = { "prettier" },
        ["less"] = { "prettier" },
        ["lua"] = { "stylua" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["yaml"] = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
    keys = {
      { "<leader>ic", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
      {
        "<leader>cf",
        function()
          require("conform").format({
            timeout_ms = 500,
            lsp_fallback = true,
          })
        end,
        desc = "Format",
        mode = { "n", "v" },
      },
    },
  },
}
