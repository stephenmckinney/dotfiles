--------------------------------------------------------------------------------
-- LSP
--
-- * mason.nvim is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers, DAP servers, linters, and formatters through a single interface.
-- * lspconfig: A set of common configurations for language servers.  Each language server provides rich language-specific features like autocompletion, go-to-definition, find-references, and more.
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
    -- stylua: ignore
    keys = {
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
      { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition"},
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "Goto Implementation" },
      { "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Goto T[y]pe Definition" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
      { "gw", "<cmd>Telescope diagnostics<cr>", desc = "Goto Workspace diagnostics" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }},
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "Source Action",
      }
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
      -- use lua_ls for autocompletion,
      -- enable diagnostics, disable formatting
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { enable = true },
            format = { enable = false },
          },
        },
      })

      -- Ruby
      -- use solargraph for autocompletion,
      -- enable diagnostics, disable formatting
      lspconfig.solargraph.setup({
        settings = { solargraph = { diagnostics = true } },
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
    config = true,
  },
}
