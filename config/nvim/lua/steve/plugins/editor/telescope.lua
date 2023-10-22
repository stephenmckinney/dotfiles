-- Fuzzy Finder
-- Telescope is a highly customizable fuzzy finder plugin that helps to locate files, buffers, or lines of code.
return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.x",
    dependencies = {
      -- This plugin allows Telescope to use the fzf fuzzy finder.
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = "Telescope",
    config = function()
      -- Fixes a bug where folds don't work when a file is opened in Telescope
      -- This issue has been discussed at https://github.com/nvim-treesitter/nvim-treesitter/issues/4754
      local function stopinsert(callback)
        return function(prompt_bufnr)
          vim.cmd.stopinsert()
          vim.schedule(function()
            callback(prompt_bufnr)
          end)
        end
      end
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = stopinsert(actions.select_default),
              ["<C-x>"] = stopinsert(actions.select_horizontal),
              ["<C-v>"] = stopinsert(actions.select_vertical),
              ["<C-t>"] = stopinsert(actions.select_tab),
            },
          },
        },
      })
      require("telescope").load_extension("fzf")

      -- Set letters that match search to a bright color
      -- Colorscheme tweak for nightfox
      -- vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Number" })
    end,
    -- stylua: ignore
    keys = {
      -- find
      { "<leader>t", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>b", "<cmd>Telescope buffers sort_lastused=true ignore_current_buffer=true<cr>", desc = "List open buffers" },
      -- grep
      { "<leader>a", "<cmd>Telescope live_grep<cr>", desc = "Search for a string (rg)" },
      -- fuzzy search
      {
        -- No: path_display = { "smart" }, because path display will not be uniform
        -- Yes: only_sort_text = true,
        --   Pro: e.g. search for "editor", will not prioritize files named "editor.lua"
        --   Con: you can no longer exclude by filename e.g. "editor !json"
        "<leader>f",
        function()
          require("telescope.builtin").grep_string({
            search = "",
            word_match = "-w",
            only_sort_text = true,
            prompt_title = "Fuzzy Search (fzf)",
          })
        end,
        desc = "Fuzzy search for a string (fzf)",
      },
      {
        "<leader>F",
        function()
          require("telescope.builtin").grep_string({
            word_match = "-w",
          })
        end,
        desc = "Search for word/selection, then fuzzy search (rg -> fzf)",
      },
      -- resume
      { "<leader>S", "<cmd>Telescope resume<cr>",                     desc = "Resume previous picker" },
      -- 'search' leaders
      { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "List autocommands, go to their declaration on <cr>" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy search currently open buffer" },
      {
        "<leader>sd",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("$HOME/.dotfiles/"),
          })
        end,
        desc = "Find dotfiles",
      },
      { "<leader>sf", "<cmd>Telescope filetypes<cr>",                 desc = "List filetypes" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",                 desc = "List help tags" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>",                desc = "List highlights" },
      { "<leader>sj", "<cmd>Telescope jumplist<cr>",                  desc = "List jumplist" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",                   desc = "List keymappings, for normal mode" },
      { "<leader>sm", "<cmd>Telescope marks<cr>",                     desc = "List marks, and their value" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",                 desc = "List manpage entries, open them in a help window on <cr>" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "List Vim options, allows you to edit the current value on <cr>" },
      { "<leader>sp", "<cmd>Telescope oldfiles<cr>",                  desc = "List previously open files" },
      { "<leader>ss", "<cmd>Telescope search_history<cr>",            desc = "List searches that were executed recently, and reruns them on <cr>" },
      { "<leader>st", "<cmd>Telescope current_buffer_tags<cr>",       desc = "List tags for the currently open buffer, with a preview" },
      { "<leader>sT", "<cmd>Telescope tags<cr>",                      desc = "List tags in current directory with tag location file preview (run ctags -R)" },
      { "<leader>sx", "<cmd>Telescope commands<cr>",                  desc = "List commands, available plugin/user cmds and runs them on <cr>" },
      { "<leader>sX", "<cmd>Telescope command_history<cr>",           desc = "List command history, executed recently and reruns them on <cr>" },
      {
        "<leader>sv",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.expand("$HOME/.dotfiles/config/nvim/"),
          })
        end,
        desc = "Find nvim config files",
      },
      -- git
      { "<leader>gl", "<cmd>Telescope git_bcommits<CR>", desc = "`git log` on current buffer (Telescope)" },
      { "<leader>gL", "<cmd>Telescope git_commits<CR>",  desc = "`git log` on current directory (Telescope)" },
      { "<leader>gS", "<cmd>Telescope git_status<CR>",   desc = "`git status` (Telescope)" },
      -- Meh?
      -- { "<leader>sl", "<cmd>Telescope loclist<cr>",         desc = "Lists items from the current window's location list" },
      -- { "<leader>sp", "<cmd>Telescope pickers<cr>",         desc = "Lists the previous pickers incl. multi-selections (see :h telescope.defaults.cache_picker)" },
      -- { "<leader>sq", "<cmd>Telescope quickfix<cr>",        desc = "Lists items in the quickfix list" },
      -- { "<leader>sq", "<cmd>Telescope quickfixhistory<cr>", desc = "Lists all quickfix lists in your history and open them with builtin.quickfix or quickfix window" },
      -- { "<leader>sr", "<cmd>Telescope registers<cr>",       desc = "Lists vim registers, pastes the contents of the register on <cr>" },
      -- { "<leader>ss", "<cmd>Telescope spell_suggest<cr>",   desc = "Lists spelling suggestions for the current word under the cursor, replaces word with selected suggestion on <cr>" },
    },
  },
}
