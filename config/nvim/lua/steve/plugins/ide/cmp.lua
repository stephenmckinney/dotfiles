--------------------------------------------------------------------------------
-- Completion Configuration
--
-- Setup for automatic code completion. The following sources are used:
-- * LSP (Language Server Protocol): Context-aware suggestions using language servers.
-- * Snippets: Code snippets for faster and easier coding.
-- * Buffer: Suggestions from the currently open buffers.
-- * Path: File and directory path completion.
--------------------------------------------------------------------------------

return {
  -- Snippet Management
  -- LuaSnip is used for snippets and is configured to use friendly-snippets.
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp", -- Build step for LuaSnip.
    dependencies = { "rafamadriz/friendly-snippets" }, -- Use friendly-snippets for our snippets.
    config = function()
      -- Lazy load snippets from friendly-snippets.
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
    keys = {}, -- No special keybindings set for snippets.
  },

  -- Auto-completion using nvim-cmp
  -- nvim-cmp is a completion framework that supports multiple sources such as LSP, buffer, path and snippets.
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter", -- Auto completion is triggered when insert mode is entered.
    dependencies = {
      -- Sources for auto completion:
      "hrsh7th/cmp-nvim-lsp", -- LSP (Language Server Protocol) source.
      "hrsh7th/cmp-buffer", -- Buffer source.
      "hrsh7th/cmp-path", -- Path source.
      "saadparwaiz1/cmp_luasnip", -- Snippets source.
    },
    config = function()
      -- require("copilot_cmp").setup()
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- Function to check if there are words before the cursor in the current line.
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      -- Setting up nvim-cmp with custom mappings and sources.
      cmp.setup({
        -- Configure snippets for nvim-cmp.
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        -- Mappings for nvim-cmp.
        -- These are designed to mimic the functionality of SuperTab.
        mapping = cmp.mapping.preset.insert({
          -- SuperTab like mapping
          -- On pressing <Tab>:
          -- If the completion menu is visible, select the next item.
          -- If a snippet is expandable or jumpable at the cursor, trigger the action.
          -- If there is a word before the cursor, complete it.
          -- If none of the above apply, insert a Tab character.
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          -- On pressing <S-Tab>:
          -- If the completion menu is visible, select the prev item.
          -- If a snippet is jumpable at the cursor, trigger the action.
          -- If none of the above apply, insert a Tab character.
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          -- The remaining mappings have specific functions within nvim-cmp:
          -- * <C-u> and <C-d> scroll through the documentation (in chunks of 4 lines).
          -- * <C-Space> triggers the completion function.
          -- * <C-e> aborts/closes completion.
          -- * <CR> confirms the selection, including the current implicit selection.
          ["<C-u>"] = cmp.mapping.scroll_docs(4),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          -- ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
          }),
        }),
        -- Set up completion sources.
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP-based completion
          { name = "luasnip" }, -- Snippet-based completion
          { name = "buffer" }, -- Completion from current buffer
          { name = "path" }, -- File path completion
        }),
      })
    end,
  },
}
