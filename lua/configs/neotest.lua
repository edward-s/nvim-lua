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
	floating = {
		options = {
			wrap = true,
		},
	},
	summary = {
		mappings = {
			expand = { "<Space>" },
			jumpto = "<CR>",
		},
	},
})
