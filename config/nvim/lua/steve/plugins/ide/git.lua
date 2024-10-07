------------------------------------------------------------------------------
-- Git
------------------------------------------------------------------------------
return {
  -- A(n awesome) Git wrapper
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    dependencies = { "tpope/vim-rhubarb" },
    -- stylua: ignore
    keys = {
      -- git
      { "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "`git blame` (inline)" },
      { "<leader>gB", "<cmd>Git blame<cr>",                          desc = "`git blame` (Fugitive)" },
      { "<leader>gc", "<cmd>Git commit<cr>",                         desc = "`git commit`" },
      { "<leader>gd", "<cmd>Gvdiffsplit<cr>",                        desc = "`git diff`" },
      { "<leader>gh", "<cmd>GBrowse<cr>",                            desc = "Open file in GitHub" },
      { "<leader>gr", "<cmd>Gread<cr>",                              desc = "Gread | `git checkout` (restore working tree file)" },
      { "<leader>gw", "<cmd>Gwrite<cr>",                             desc = "Gwrite | `git add` (stage file)" },
      {
        "<leader>gs",
        function()
          local lines = math.ceil(vim.opt.lines:get() * 2 / 3)
          vim.cmd("Git")
          vim.api.nvim_win_set_height(0, lines)
        end,
        desc = "`git status` (Fugitive)",
      },
      -- diff
      { "<leader>dg", ":diffget<bar>diffudpate<cr>", mode = "x", desc = "diffget" },
      { "<leader>dp", ":diffput<bar>diffupdate<cr>", mode = "x", desc = "diffput" },
    },
  },
}
