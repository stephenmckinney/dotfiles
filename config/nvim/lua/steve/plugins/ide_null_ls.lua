return {
  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- null-ls package manager
      "williamboman/mason.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      -- Set up in the following order:
      -- 1. mason
      -- 2. mason-null-ls
      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "prettier", "markdownlint" },
      })

      -- 3. Setup non-LSP sources to hook into its LSP client

      -- only run null-ls format
      local lsp_formatting = function(bufnr)
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          bufnr = bufnr,
        })
      end

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- formatting
          null_ls.builtins.formatting.prettier.with({ disabled_filetypes = { "markdown" } }), -- javascript, typescript, html, css, json, yaml, graphql
          null_ls.builtins.formatting.stylua, -- lua
          -- diagnostics
          null_ls.builtins.diagnostics.markdownlint, -- markdown
        },
        on_attach = function(client, bufnr)
          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                lsp_formatting(bufnr)
              end,
            })
          end
        end,
      })
    end,
  },
}
