--------------------------------------------------------------------------------
-- Treesitter
--
-- Tree-sitter is essentially a parser generator tool and an incremental parsing
-- library. It can build parse trees for multiple programming languages and keep
-- the trees updated as you type.
--
-- Adds:
-- * Syntax highlighting
-- * Indentation
-- * Text objects
-- * Code navigation
-- * Refactoring?
--------------------------------------------------------------------------------
return {

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      -- Syntax aware text-objects, select, move, swap, and peek support e.g. mini.ai.
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      -- Treesitter aware way to wisely add "end" in Ruby, Vimscript, Lua, etc.
      { "RRethy/nvim-treesitter-endwise" },
    },
    keys = {
      { "<leader>i", desc = "Init incremental selection" },
      { "gi", desc = "Increment selection", mode = "x" },
      { "gd", desc = "Decrement selection", mode = "x" },
      { "gs", desc = "Increment scope selection", mode = "x" },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            -- mode = normal
            init_selection = "<leader>i",
            -- mode = visual (x)
            node_incremental = "gi",
            node_decremental = "gd",
            scope_incremental = "gs",
          },
        },
        ensure_installed = {
          "bash",
          "c",
          "css",
          "diff",
          "html",
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
          -- 'ruby,', -- broken
          "scss",
          "sql",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
      })
    end,
  },
}
