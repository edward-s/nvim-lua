return {
	{
		"akinsho/toggleterm.nvim",
		event = { "VimEnter" },
    --stylua: ignore
		keys = {
			{ [[<C-t>]] },
			{ "<leader>gg", function() require("utils.toggleterm").lazygit_toggle() end, desc = "Lazygit", },
			{ "<leader>st", "<cmd>TermSelect<cr>", desc = "Select Terminals" },
			{ "<leader>zd", function() require("utils.toggleterm").lazydocker_toggle() end, desc = "Lazydocker", },
		},
		opts = {
			autochdir = true,
			size = 20,
			open_mapping = [[<C-t>]],
			close_on_exit = true,
			start_in_insert = true,
			persist_mode = true,
			direction = "float",
			float_opts = {
				border = "curved",
				winblend = 0,
				width = math.floor(0.95 * vim.fn.winwidth(0)),
				height = math.floor(0.9 * vim.fn.winheight(0)),
			},
		},
	},
}
