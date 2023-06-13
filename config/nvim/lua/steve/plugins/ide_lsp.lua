--------------------------------------------------------------------------------
-- LSP
--
-- * mason.nvim is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.
-- * lspconfig: A set of common configurations for language servers.  Each language server provides rich language-specific features like autocompletion, go-to-definition, find-references, and more.
-- * null-ls: Treat external tools (like linters, formatters, or any command-line program) as virtual language servers, thus integrating their functionality into NeoVim's LSP ecosystem.
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
      -- nvim lua api completion. Automatically configures lua_ls LSP.
      { "folke/neodev.nvim", opts = {} },
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
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", -- lua
          "solargraph", -- ruby
          "tsserver", -- typescript, javascript
          "html", -- html
          "cssls", -- css
          "jsonls", -- json
        },
      })

      -- 3. Setup servers via lspconfig
      local lspconfig = require("lspconfig")

      -- Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            format = { enable = false },
          },
        },
      })

      -- Ruby
      lspconfig.solargraph.setup({
        init_options = { formatting = false },
      })

      -- TypeScript, JavaScript
      lspconfig.tsserver.setup({})

      -- HTML, CSS, JSON
      lspconfig.html.setup({})
      lspconfig.cssls.setup({})
      lspconfig.jsonls.setup({})

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

  -- Neovim package manager
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require("mason").setup({})
    end,
  },
}
