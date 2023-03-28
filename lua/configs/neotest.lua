local neotest = require("neotest")

neotest.setup({
	icons = {
		running = "↻",
	},
	adapters = {
		require("neotest-jest"),
	},
	output = {
		open_on_run = false,
	},
	quickfix = {
		enabled = false,
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
})
