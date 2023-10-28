return {
	{
		"akinsho/toggleterm.nvim",
		event = { "VimEnter" },
    --stylua: ignore
		keys = {
			{ [[<C-t>]] },
			{ "<leader>gg", function() require("utils.toggleterm").lazygit_toggle() end, desc = "Lazygit", },
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
			on_open = function(term)
				if term.cmd ~= "lazygit" then
					local opts = { noremap = true }
					vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
				end
			end,
			float_opts = {
				border = "curved",
				winblend = 0,
				width = math.floor(0.95 * vim.fn.winwidth(0)),
				height = math.floor(0.9 * vim.fn.winheight(0)),
			},
		},
	},
}
