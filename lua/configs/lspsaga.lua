local lspsaga = require("lspsaga")

lspsaga.setup({
	ui = {
		title = false,
		border = "rounded",
	},
	rename = {
		quit = "q",
	},
	finder = {
		keys = {
			expand_or_jump = "<Enter>",
		},
	},
})
