return {
  -- nvim-dap
  {
    "mfussenegger/nvim-dap",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {

      -- fancy UI for the debugger
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
        -- stylua: ignore
        keys = {
          { "<leader>xu", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
          { "<leader>xe", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        },
        config = function()
          -- setup dap config by VsCode launch.json file
          -- require("dap.ext.vscode").load_launchjs()
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup({
            layouts = {
              {
                -- Sidebar bottom to top
                elements = {
                  { id = "breakpoints", size = 0.25 },
                  { id = "stacks", size = 0.25 },
                  { id = "scopes", size = 0.25 },
                  { id = "watches", size = 0.25 },
                },
                size = 40,
                position = "left", -- Can be "left" or "right"
              },
              {
                elements = {
                  "repl",
                  "console",
                },
                size = 10,
                position = "bottom", -- Can be "bottom" or "top"
              },
            },
          })
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },

      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },

      -- ruby support
      { "suketa/nvim-dap-ruby" },

      -- mason.nvim integration
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mason.nvim" },
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          -- Makes a best effort to setup the various debuggers with
          -- reasonable debug configurations
          automatic_installation = true,

          -- You can provide additional configuration to the handlers,
          -- see mason-nvim-dap README for more information
          handlers = {},

          -- You'll need to check that you have the required things installed
          -- online, please don't ask me how to install them :)
          ensure_installed = {
            -- Update this to ensure that you have the debuggers for the langs you want
            "js-debug-adapter",
          },
        },
      },
    },
    -- stylua: ignore
    keys = {
      -- Fast access to common tasks
      { "gB", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "gC", function() require("dap").continue() end, desc = "Continue" },
      { "gi", function() require("dap").step_into() end, desc = "Step Into" },
      { "go", function() require("dap").step_over() end, desc = "Step Over" },
      { "gO", function() require("dap").step_out() end, desc = "Step Out" },
      -- The rest
      { "<leader>xB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>xC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>xg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
      { "<leader>xj", function() require("dap").down() end, desc = "Down" },
      { "<leader>xk", function() require("dap").up() end, desc = "Up" },
      { "<leader>xl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>xp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>xr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>xs", function() require("dap").session() end, desc = "Session" },
      { "<leader>xt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>xw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },

    config = function()
      local dap = require("dap")

      -- Highlight dap stopped line
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      -- Load dap icons
      local dap_icons = {
        Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint = " ",
        BreakpointCondition = " ",
        BreakpointRejected = { " ", "DiagnosticError" },
        LogPoint = ".>",
      }

      for name, sign in pairs(dap_icons) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define("Dap" .. name, { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] })
      end

      -- Setup ruby debug adapter
      require("dap-ruby").setup()

      -- Setup javascript debug adapter
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          -- 💀 Make sure to update this path to point to your installation
          args = {
            require("mason-registry").get_package("js-debug-adapter"):get_install_path() .. "/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file (ts-node)",
            cwd = "${workspaceFolder}",
            runtimeArgs = { "-r", "ts-node/register" },
            program = "${workspaceFolder}/src/index.ts",
            skipFiles = { "<node_internals>/**", "**/node_modules/**" },
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            port = "9229",
            cwd = "${workspaceFolder}",
          },
        }
      end
    end,
  },
}
