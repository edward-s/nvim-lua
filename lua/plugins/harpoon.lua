return {
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
    --stylua: ignore
    keys = {
      { "<leader>ja", function() require("harpoon.mark").add_file() end, desc = "Add File" },
      { "<leader>jj", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Jump Menu" },
      { "<leader>1", function() require("harpoon.ui").nav_file(1) end, desc = "File 1" },
      { "<leader>2", function() require("harpoon.ui").nav_file(2) end, desc = "File 2" },
      { "<leader>3", function() require("harpoon.ui").nav_file(3) end, desc = "File 3" },
    },
		config = true,
	},
}
