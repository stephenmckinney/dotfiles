# Neovim Config

## Editor

- File explorer `nvim-tree`
- Fuzzy finder `telescope`
- Search and replace across workspace `nvim-spectre`
- Tons of editing super powers (e.g. autopairs, surrounds, comments, etc.)

## IDE

| Language      | Tree-sitter |            LSP            |   Linting    | Formatting | Testing  |
| ------------- | :---------: | :-----------------------: | :----------: | :--------: | :------: |
| Ruby          |      x      |       `solargraph`        | `solargraph` | `rubocop`  |    x     |
| JavaScript    |      x      |          `ts_ls`          |  `eslint_d`  | `prettier` |  `jest`  |
| TypeScript    |      x      |          `ts_ls`          |  `eslint_d`  | `prettier` |    x     |
| HTML/CSS/JSON |      x      | `html`, `cssls`, `jsonls` |  `prettier`  | `prettier` |   N/A    |
| Markdown      |      x      |            No             |  `prettier`  | `prettier` |   N/A    |
| Lua           |      x      |         `lua_ls`          |   `stylua`   |  `stylua`  | `busted` |
| Python        |      x      |            No             |      No      |     No     |    No    |
| Shell         |      x      |            No             | `shellcheck` |     No     |   N/A    |
| Go            |      x      |          `gopls`          |   `gopls`    |  `gopls`   |    No    |

- Tree-sitter `nvim-treesitter`

  - Syntax highlighting
  - Text objects
  - Code folding
  - Indention

- Language Server Protocol (LSP) `nvim-lspconfig`

  - Autocompletion
  - Go to Definition
  - Find References
  - Diagnostics
  - Linting
  - Refactoring
  - Code Action
  - Signature Help

- Formatting

  - `Conform`

- Linting

  - `nvim-lint`

- Testing

  - `neotest`

- Completion

  - Auto-completion `nvim-cmp`
  - Snippets `luasnip`

- Git integration

  - `vim-fugitive`
  - `git-blame`

- AI

  - `copilot`
  - `chatgpt`

- UI
  - Indentation `indent-blankline`, `mini.indentsope`
  - Status column `statuscol`, `gitsigns`,
  - Status line `lualine`

## TODO

- [ ] bring all the goodies from my old vimfiles
