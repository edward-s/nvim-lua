return {
	{
		"zbirenbaum/copilot.lua",
		build = ":Copilot auth",
		event = { "BufReadPre", "BufNewFile" },
    -- stylua: ignore
		keys = { { "<leader>ap", function() require("copilot.panel").open() end, desc = "Copilot panel" } },
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
		},
	},
}
