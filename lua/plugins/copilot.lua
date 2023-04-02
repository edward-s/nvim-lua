return {
	{
		"zbirenbaum/copilot.lua",
		build = ":Copilot auth",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			panel = {
				auto_refresh = true,
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-e>",
				},
			},
		},
	},
}
