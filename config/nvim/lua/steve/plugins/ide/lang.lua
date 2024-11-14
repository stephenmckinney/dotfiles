--------------------------------------------------------------------------------
-- Language Support
--------------------------------------------------------------------------------
local Util = require("steve.util")

return {
  --------------------------------------------------------------------------------
  -- Treesitter
  --
  -- Ensure the list of parsers are always installed.
  --------------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "c",
        "comment",
        "css",
        "diff",
        "html",
        "fish",
        "go",
        "graphql",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "scss",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
  },

  --------------------------------------------------------------------------------
  -- LSP
  --
  -- Ensure the list of third-party tools are always installed for
  -- LSP servers, DAP servers, linters, and formatters using Mason,
  -- a Neovim package manager.
  --------------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = true,
    cmd = "Mason",
    keys = {
      { "<leader>im", "<cmd>Mason<cr>", desc = "Mason" },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      ensure_installed = {
        -- LSP servers
        -- See: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
        "bashls", -- sh
        "cssls", -- css
        "gopls", -- go
        "graphql", -- graphql
        "html", -- html
        "jsonls", -- json
        "lua_ls", -- lua
        "marksman", -- markdown
        "pyright", -- python
        -- For ruby: gem install ruby-lsp
        "ts_ls", -- typescript, javascript
        "yamlls", -- yaml
        -- See:
        -- Formatters and Linters
        -- See: https://github.com/mason-org/mason-registry/tree/main/packages
        -- Formatters
        "prettier", -- css, graphql, html, javascript, json, markdown, typescript, vue, yaml
        "shfmt", -- sh
        "stylua", -- lua
        -- Linters
        "eslint_d", -- javascript
        "shellcheck", -- sh
      },
      integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = false,
        ["mason-nvim-dap"] = false,
      },
    },
  },

  --------------------------------------------------------------------------------
  -- LSP
  --
  -- Configure LSP servers.
  --------------------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.bashls.setup({})
      lspconfig.cssls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.graphql.setup({})
      lspconfig.html.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.marksman.setup({})
      lspconfig.pyright.setup({})
      lspconfig.ts_ls.setup({})

      --------------------------------------------------------------------------------
      -- Lua
      --
      -- * use for autocompletion
      -- * enable diagnostics
      -- * disable formatting
      --------------------------------------------------------------------------------
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { enable = true },
            format = { enable = false },
          },
        },
      })

      --------------------------------------------------------------------------------
      -- Ruby
      --------------------------------------------------------------------------------
      lspconfig.ruby_lsp.setup({
        cmd = { vim.fn.expand("~/.rbenv/shims/ruby-lsp") },
      })

      --------------------------------------------------------------------------------
      -- Diagnostic Signs
      --------------------------------------------------------------------------------
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

  --------------------------------------------------------------------------------
  -- Linters
  --
  -- Configure linters.
  --------------------------------------------------------------------------------
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "williamboman/mason.nvim",
    },
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
  },

  --------------------------------------------------------------------------------
  -- Formatters
  --
  -- Configure formatters.
  --------------------------------------------------------------------------------
  {
    "stevearc/conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      formatters_by_ft = {
        ["css"] = { "prettier" },
        -- ["fish"] = { "fish_indent" },
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
  },

  -- Ruby on Rails power tools
  { "tpope/vim-rails" },

  -- nvim lua api completion. Automatically configures lua_ls LSP.
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
  },
}
