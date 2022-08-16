local saga = require("lspsaga")

saga.init_lsp_saga({
	border_style = "rounded",
	finder_action_keys = {
		open = "<Enter>",
	},
	show_outline = {
		jump_key = "<Enter>",
	},
})
