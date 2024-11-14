return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-vim-test",
      "vim-test/vim-test",
    },
    config = function()
      local neotest = require("neotest")
      local wk = require("which-key")

      neotest.setup({
        adapters = {
          require("neotest-rspec"),
          require("neotest-vim-test")({
            allow_file_types = { "lua", "ruby" },
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

      wk.add({
        {
          "<leader>r",
          function()
            neotest.output_panel.open()
            neotest.run.run(vim.fn.expand("%"))
          end,
          desc = "Neotest: Run current test file",
          icon = { cat = "extension", name = "test.jsx" },
        },
        {
          "<leader>R",
          function()
            neotest.run.run()
          end,
          desc = "Neotest: Run nearest test",
          icon = { cat = "extension", name = "test.jsx" },
        },
      })
    end,
  },
}
