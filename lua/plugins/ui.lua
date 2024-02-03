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
		config = function()
			local banned_messages = { "No information available", "Done!" }
			vim.notify = function(msg, ...)
				for _, banned in ipairs(banned_messages) do
					if msg == banned then
						return
					end
				end
				return require("notify")(msg, ...)
			end
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
}
