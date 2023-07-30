return {
	"folke/edgy.nvim",
	event = "VeryLazy",
  -- stylua: ignore
	keys = {
		{ "<leader>ue", function() require("edgy").toggle() end, desc = "Edgy Toggle" },
		{ "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
	},
	opts = {
		wo = {
			winhighlight = "",
		},
		bottom = {
			"Trouble",
			{ ft = "qf", title = "Quickfix" },
			{ ft = "spectre_panel", size = { height = 0.4 } },
			{
				ft = "help",
				size = { height = 20 },
				-- don't open help files in edgy that we're editing
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{ title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
			{
				ft = "toggleterm",
				-- exclude floating window
				filter = function(_, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
		},
		right = {
			{ ft = "neotest-summary", title = "Neotest Summary", size = { width = 0.15 } },
			{ ft = "aerial", title = "Code Outline" },
		},
	},
}
