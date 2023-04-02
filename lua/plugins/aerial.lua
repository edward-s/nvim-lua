return {
	{
		"stevearc/aerial.nvim",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<leader>co", "<cmd>AerialToggle<cr>", desc = "Code outline" },
		},
		config = function(_, opts)
			require("aerial").setup(opts)
		end,
	},
}
