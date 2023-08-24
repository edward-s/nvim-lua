return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "MunifTanjim/nui.nvim", lazy = true },
	{
		"rcarriga/nvim-notify",
		lazy = false,
    --stylua: ignore
		keys = {
			{
				"<leader>un", function() require("notify").dismiss({ silent = true, pending = true }) end, desc = "Dismiss all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			render = "minimal",
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			vim.notify = require("notify")
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {
			input = {
				insert_only = false,
				mappings = {
					n = {
						["q"] = "Close",
					},
				},
			},
		},
		event = { "VeryLazy" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "HiPhish/nvim-ts-rainbow2" },
		opts = function(_, opts)
			opts.rainbow = {
				enable = true,
				query = "rainbow-parens",
				strategy = require("ts-rainbow").strategy.global,
			}
		end,
	},
}
