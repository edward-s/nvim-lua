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
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
			filetypes = {
				javascript = true,
				typescript = true,
				lua = true,
				go = true,
				python = true,
				["."] = false,
			},
		},
	},
}
