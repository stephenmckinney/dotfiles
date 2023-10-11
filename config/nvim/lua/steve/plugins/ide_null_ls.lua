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
        ensure_installed = {
          -- "standardrb", -- ruby
          "stylua", -- lua
          "prettier", -- javascript, typescript, html, css, json, yaml, graphql, markdown
          -- "markdownlint", -- markdown
        },
        -- handlers = { standardrb = function() end },
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
          debug = true,
          -- formatting
          null_ls.builtins.formatting.prettier, -- javascript, typescript, html, css, json, yaml, graphql, markdown
          null_ls.builtins.formatting.stylua, -- lua
          -- null_ls.builtins.formatting.standardrb, -- ruby
          -- diagnostics
          -- null_ls.builtins.diagnostics.standardrb, -- ruby
          -- null_ls.builtins.diagnostics.markdownlint, -- markdown
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
