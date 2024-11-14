return {
  {
    "stevearc/conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
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
