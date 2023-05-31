return {
	"folke/zen-mode.nvim",
	keys = {
		{ "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
	},
	opts = {
		window = {
			backdrop = 0.95,
			width = 0.8,
			height = 1,
			options = {},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
			},
		},
	},
	config = true,
}
