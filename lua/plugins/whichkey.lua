return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")
			wk.setup({
				show_help = true,
				plugins = { spelling = true },
				key_labels = { ["<leader>"] = "SPC" },
				triggers = "auto",
				window = {
					border = "single", -- none, single, double, shadow
					position = "bottom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
					padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
					winblend = 0,
				},
				layout = {
					height = { min = 4, max = 25 }, -- min and max height of the columns
					width = { min = 20, max = 50 }, -- min and max width of the columns
					spacing = 3, -- spacing between columns
					align = "left", -- align columns left, center or right
				},
			})
			wk.register({
				b = { name = "+Buffer" },
				c = { name = "+Code" },
				d = { name = "+Debug" },
				D = { name = "+Database" },
				g = { name = "+Git" },
				j = { name = "+Jump" },
				l = { name = "+Language" },
				s = { name = "+Search" },
				t = { name = "+Test" },
				o = { name = "+Overseer" },
				u = { name = "+UI" },
				x = { name = "+Diagnostics/Quickfix" },
				z = { name = "+System" },
				["<Tab>"] = { name = "+Tab" },
			}, { prefix = "<leader>", mode = { "n", "v" } })
		end,
	},
}
