# Neovim Config

## Editor

- File explorer `nvim-tree`
- Fuzzy finder `telescope`
- Search and replace across workspace `nvim-spectre`
- Tons of editing super powers (e.g. autopairs, surrounds, comments, etc.)

## IDE

| Language      | Tree-sitter |            LSP            |  Formatting  | Testing  |
| ------------- | :---------: | :-----------------------: | :----------: | :------: |
| Ruby          |      x      |       `solargraph`        | `standardrb` |    x     |
| JavaScript    |      x      |        `tsserver`         |  `prettier`  |  `jest`  |
| TypeScript    |      x      |        `tsserver`         |  `prettier`  |    x     |
| HTML/CSS/JSON |      x      | `html`, `cssls`, `jsonls` |  `prettier`  |   N/A    |
| Markdown      |      x      |            No             |  `prettier`  |   N/A    |
| Lua           |      x      |         `lua_ls`          |   `stylua`   | `busted` |
| Python        |      x      |            No             |      No      |    No    |

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

- `null-ls`

  - Formatting

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

- UI
  - Status column `statuscol`, `gitsigns`, `indent-blankline`
  - `lualine`

TODO:
- [ ] how to integrate CoPilot
- [ ] bring all the goodies from my old vimfiles
