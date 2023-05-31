--------------------------------------------------------------------------------
-- LSP
--
-- * mason.nvim is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.
-- * lspconfig: A set of common configurations for language servers.  Each language server provides rich language-specific features like autocompletion, go-to-definition, find-references, and more.
-- * null-ls: Treat external tools (like linters, formatters, or any command-line program) as virtual language servers, thus integrating their functionality into NeoVim's LSP ecosystem.
--
-- LSP: lspconfig & mason-lspconfig.nvim
-- Linters: null-ls.nvim
-- Formatters: null-ls.nvim
--------------------------------------------------------------------------------
return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- LSP package manager
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    keys = {
      -- definition
      { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
      -- declaration
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      -- implementation
      { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
      -- references
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Goto References" },
      -- hover
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      -- workspace diagnostics
      { "gw", "<cmd>Telescope diagnostics<cr>", desc = "Goto Workspace diagnostics" },
      -- signature_help
      { "gK", vim.lsp.buf.signature_help, desc = "Goto Signature Help" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
    },
    config = function()
      -- Set up in the following order:
      -- 1. mason
      -- 2. mason-lspconfig
      -- 3. Setup servers via lspconfig
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            format = {
              enable = false,
            },
          },
        },
      })

      local icons = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }
      for name, icon in pairs(icons) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
    end,
  },

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
      require("mason").setup()
      require("mason-null-ls").setup({
        ensure_installed = { "stylua" },
      })

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
          null_ls.builtins.formatting.stylua,
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

  -- Neovim package manager
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  },
}
