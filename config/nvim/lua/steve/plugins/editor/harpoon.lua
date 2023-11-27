return {
  {
    "ThePrimeagen/harpoon",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>ha", function() require("harpoon.mark").add_file() end, desc = "Add file" },
      { "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Quick Menu" },
      { "H", function() require("harpoon.ui").nav_file(1) end, desc = "Navigate to file 1" },
      { "J", function() require("harpoon.ui").nav_file(2) end, desc = "Navigate to file 2" },
      { "K", function() require("harpoon.ui").nav_file(3) end, desc = "Navigate to file 3" },
      { "L", function() require("harpoon.ui").nav_file(4) end, desc = "Navigate to file 4" }
    }
,
  },
}
