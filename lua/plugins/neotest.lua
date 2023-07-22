return {
	"nvim-neotest/neotest",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" },
		{ "<leader>td", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", desc = "Debug Nearest" },
		{ "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
		{ "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run Last" },
		{ "<leader>tm", "<cmd>lua require('neotest').summary.run_marked()<cr>", desc = "Run Marked" },
    -- stylua: ignore
		{ "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>", desc = "Output" },
		{ "<leader>tO", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Toggle Output Panel" },
		{ "<leader>tq", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" },
		{ "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
		{ "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", desc = "Nearest" },
		{ "[t", "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", desc = "Prev Failed" },
		{ "]t", "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", desc = "Next Failed" },
	},
	dependencies = {
		"haydenmeade/neotest-jest",
	},
	config = function()
		local opts = {
			icons = {
				running = "↻",
			},
			adapters = {
				require("neotest-jest"),
			},
			diagnostic = {
				enabled = false,
			},
			output = {
				open_on_run = true,
			},
			status = {
				virtual_text = true,
			},
			floating = {
				options = {
					wrap = true,
				},
			},
			summary = {
				mappings = {
					expand = "<Space>",
					jumpto = "<CR>",
				},
			},
			quickfix = {
				open = function()
					vim.cmd("copen")
				end,
			},
		}
		require("neotest").setup(opts)
	end,
}
