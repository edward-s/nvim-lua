return {
	"stevearc/overseer.nvim",
	opts = {
		templates = { "shell", "vscode" },
		strategy = {
			"toggleterm",
			direction = "horizontal",
			auto_scroll = nil,
			close_on_exit = false,
			quit_on_exit = "never",
			open_on_start = true,
			hidden = true,
			on_create = function()
				vim.cmd("stopinsert!")
			end,
		},
	},
	event = { "VeryLazy" },
	config = function(_, opts)
		vim.api.nvim_create_user_command("OverseerRestartLast", function()
			local overseer = require("overseer")
			local tasks = overseer.list_tasks({ recent_first = true })
			if vim.tbl_isempty(tasks) then
				vim.notify("No tasks found", vim.log.levels.WARN)
			else
				overseer.run_action(tasks[1], "restart")
			end
		end, {})
		require("overseer").setup(opts)
	end,
	keys = {
		{ "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
		{ "<leader>ob", "<cmd>OverseerBuild<cr>", desc = "Build" },
		{ "<leader>ol", "<cmd>OverseerRestartLast<cr>", desc = "Restart Last" },
		{ "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
		{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run" },
		{ "<leader>oR", "<cmd>OverseerRunCmd<cr>", desc = "Run Command" },
		{ "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
	},
}