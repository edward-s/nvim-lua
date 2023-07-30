return {
	{
		"jedrzejboczar/toggletasks.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		event = "VeryLazy",
		opts = {
			telescope = {
				spawn = {
					show_running = true,
				},
			},
			toggleterm = {
				direction = "horizontal",
			},
		},
    --stylua: ignore
		keys = {
			{ "<leader>sc", function() require("telescope").extensions.toggletasks.spawn() end, desc = "Commands" },
		},
	},
}
