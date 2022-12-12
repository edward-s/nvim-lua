require("copilot").setup({
	panel = {
		auto_refresh = true,
	},
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = "<C-e>",
		},
	},
})

require("copilot_cmp").setup()
