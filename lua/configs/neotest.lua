local neotest = require("neotest")

neotest.setup({
	icons = {
		running = "↻",
	},
	adapters = {
		require("neotest-jest"),
	},
	floating = {
		options = {
			wrap = true,
		},
	},
})
