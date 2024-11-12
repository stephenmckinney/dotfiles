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
    main = 'nvim-treesitter.configs',
    dependencies = {
      -- Syntax aware text-objects, select, move, swap, and peek support e.g. mini.ai.
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      -- Treesitter aware way to wisely add "end" in Ruby, Vimscript, Lua, etc.
      { "RRethy/nvim-treesitter-endwise" },
      -- View treesitter information.
      { "nvim-treesitter/playground" },
      -- Show current code context.
      { "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 3 }, },
    },
    -- stylua: ignore
    keys = {
      { "<C-space>",        desc = "Init incremental selection" },
      { "<C-space>",        desc = "Increment selection", mode = "x" },
      { "<bs>",             desc = "Decrement selection", mode = "x" },
    },
    opts = {
      -- enable nvim-treesitter internal modules
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          -- mode = normal
          init_selection = "<C-space>",
          -- mode = visual (x)
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      -- enable external modules
      endwise = { enable = true },
    }
  },
}
