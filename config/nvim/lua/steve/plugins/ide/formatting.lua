return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      -- Set default values when calling conform.format()
      -- Will also affect the default values for format_on_save/format_after_save
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        timeout_ms = 500,
      },
      -- Set the log level. Use `:ConformInfo` to see the location of the log file.
      log_level = vim.log.levels.ERROR,
      -- Conform will notify you when a formatter errors
      notify_on_error = true,
      -- Formatters
      formatters_by_ft = {
        ["css"] = { "prettier" },
        ["fish"] = { "fish_indent" },
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
        ["ruby"] = { "rubocop" },
        ["scss"] = { "prettier" },
        ["sh"] = { "shfmt" },
        ["typescript"] = { "prettier" },
        ["typescriptreact"] = { "prettier" },
        ["vue"] = { "prettier" },
        ["yaml"] = { "prettier" },
      },
      -- The options you set here will be merged with the builtin formatters.
      formatters = {
        ruby = {
          command = { "bundle exec rubocop" },
        },
      },
    },
    keys = {
      { "<leader>ic", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
      {
        "<leader>cf",
        function()
          require("conform").format()
        end,
        desc = "Format",
        mode = { "n", "v" },
      },
    },
  },
}
