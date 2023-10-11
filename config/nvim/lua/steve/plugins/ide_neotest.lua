return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-vim-test",
      "vim-test/vim-test",
    },
    keys = {
      {
        "<leader>r",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Neotest: Run current test file",
      },
      {
        "<leader>R",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Neotest: Open summary window",
      },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vim-test")({
            allow_file_types = { "lua" },
          }),
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.js",
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          }),
        },
      })
    end,
  },
}
