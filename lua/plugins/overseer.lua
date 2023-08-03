return {
	"stevearc/overseer.nvim",
	opts = {
		strategy = {
			"toggleterm",
			direction = "horizontal",
			auto_scroll = nil,
			close_on_exit = false,
			quit_on_exit = "never",
			open_on_start = true,
			hidden = true,
			on_create = nil,
		},
	},
	event = { "VeryLazy" },
	keys = {
		{ "<leader>oR", "<cmd>OverseerRunCmd<cr>", desc = "Run Command" },
		{ "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
		{ "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Build" },
		{ "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
		{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run" },
		{ "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
	},
}
