-- Search/Replace in Multiple Files
-- nvim-spectre provides powerful search and replace capabilities across multiple files.
return {
  {
    "nvim-pack/nvim-spectre",
    opts = {
      -- colorscheme tweak for nightfox
      highlight = {
        replace = "@text.warning",
      },
    },
    -- stylua: ignore
    keys = {
      -- Search and Replace all files in current directory
      { "<leader>sr", '<cmd>lua require("spectre").open()<CR>',                               desc = "Open Search and Replace (Spectre)" },
      { "<leader>sR", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',      desc = "Search and Replace word under cursor (Spectre)" },
      { "<leader>sR", '<esc><cmd>lua require("spectre").open_visual()<CR>', mode = "x",       desc = "Search and Replace current selection (Spectre)" },
      -- Search and Replace on current file
      { "<leader>sb", '<cmd>lua require("spectre").open_file_search()<CR>',                   desc = "Search and Replace on current file (Spectre)" },
      { "<leader>sB", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "Search and Replace word under cursor on current file (Spectre)" },
    },
  },
}
