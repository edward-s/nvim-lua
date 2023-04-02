return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"f-person/git-blame.nvim",
		event = { "BufReadPost", "BufNewFile" },
		keys = { { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Git Blame" } },
	},
	{
		"sindrets/diffview.nvim",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<leader>gd", "<cmd>lua require('utils.diffview').toggle()<cr>", desc = "Git Diff" },
			{ "<leader>gh", "<cmd>lua require('utils.diffview').toggle_file_history()<cr>", desc = "Git History" },
		},
		opts = {
			key_bindings = {
				view = {
					["q"] = "<cmd>DiffviewClose<cr>",
				},
				file_panel = {
					["q"] = "<cmd>DiffviewClose<cr>",
				},
				file_history_panel = {
					["q"] = "<cmd>DiffviewClose<cr>",
				},
			},
		},
		config = function(_, opts)
			require("diffview").setup(opts)
		end,
	},
}
