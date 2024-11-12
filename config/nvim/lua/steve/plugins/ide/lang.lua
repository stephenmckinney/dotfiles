--------------------------------------------------------------------------------
-- Language Support
--
--------------------------------------------------------------------------------

return {
  {
    "nvim-treesitter/nvim-treesitter",
    main = 'nvim-treesitter.configs',
    opts = {
      -- A list of parser that should always be installed
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
      }
    }
  }
}
