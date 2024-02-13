return {
	"nvim-neotest/neotest",
	event = { "BufReadPost", "BufNewFile" },
  -- stylua: ignore
	keys = {
		{ "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" },
		{ "<leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", desc = "Debug Nearest" },
		{ "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
		{ "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run Last" },
		{ "<leader>tm", "<cmd>lua require('neotest').summary.run_marked()<cr>", desc = "Run Marked" },
		{ "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>", desc = "Output" },
		{ "<leader>tc", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle Output Panel" },
		{ "<leader>tq", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" },
		{ "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
		{ "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Nearest" },
    { "]t", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Next failed test", },
    { "[t", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Previous failed test", },
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-jest",
		"mfussenegger/nvim-dap",
	},
	opts = function()
		return {
			adapters = {
				require("neotest-jest")({
					jest_test_discovery = false,
				}),
			},
			discovery = {
				enabled = false,
			},
			diagnostic = {
				enabled = false,
			},
			floating = {
				options = {
					wrap = true,
				},
			},
			icons = {
				running = "↻",
			},
			output = {
				open_on_run = false,
			},
			status = {
				virtual_text = true,
			},
			summary = {
				mappings = {
					expand = "<Space>",
					jumpto = "<CR>",
				},
			},
		}
	end,
	config = function(_, opts)
		require("neotest").setup(opts)
	end,
}
