return {
	"nvim-neotest/neotest",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" },
		{ "<leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", desc = "Debug Nearest" },
		{ "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
		{ "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run Last" },
		{ "<leader>tm", "<cmd>lua require('neotest').summary.run_marked()<cr>", desc = "Run Marked" },
		{ "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
		{ "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
		{ "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" },
		{ "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Nearest" },
	},
	dependencies = {
		"haydenmeade/neotest-jest",
	},
	config = function()
		local opts = {
			adapters = {
				require("neotest-jest"),
			},
		}
		require("neotest").setup(opts)
	end,
}
