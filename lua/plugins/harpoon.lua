return {
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		keys = {
			{ "<leader>ja", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add jump" },
			{ "<leader>jj", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Jump Menu" },
			{ "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "File 1" },
			{ "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "File 2" },
		},
	},
}
