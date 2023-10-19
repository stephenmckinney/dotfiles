--------------------------------------------------------------------------------
-- ChatGPT
--------------------------------------------------------------------------------

return {
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chatgpt").setup()
    end,
    keys = {
      { "<leader>cc", "<cmd>ChatGPT<CR>", "ChatGPT" },
      { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
      { "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
      { "<leader>ct", "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
      { "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
      { "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
      { "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
      { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
      { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
      { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
      { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
      { "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
      { "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
    },
  },
}
