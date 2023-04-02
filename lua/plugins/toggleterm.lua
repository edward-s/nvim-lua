return {
	{
		"akinsho/toggleterm.nvim",
    --stylua: ignore
		keys = {
			{ [[<C-t>]] },
			{ "<leader>gg", function() require("utils.term").lazygit_toggle() end, desc = "Lazygit", },
		},
		opts = {
			size = 20,
			open_mapping = [[<C-t>]],
			close_on_exit = true,
			start_in_insert = true,
			persist_mode = true,
			direction = "float",
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
	},
}
