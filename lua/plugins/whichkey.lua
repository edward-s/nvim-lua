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
				["h"] = { "<cmd>nohlsearch<cr>", "No Highlight Search" },
				["q"] = { "<cmd>lua require('utils').quit()<CR>", "Quit" },
				["w"] = { "<cmd>w<cr>", "Save" },
				b = {
					name = "+Buffer",
					r = { "<c-w>r", "Swap" },
					v = { "<cmd>vsplit<cr>", "Vertical split" },
					x = { "<cmd>split<cr>", "Horizontal split" },
				},
				c = { name = "+Code" },
				d = { name = "+Debug" },
				g = { name = "+Git" },
				s = { name = "+Search" },
				t = { name = "+Test" },
				z = { name = "+System" },
			}, { prefix = "<leader>", mode = { "n" } })
		end,
	},
}