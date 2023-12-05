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
			direction = "float",
			on_open = function(term)
				if term.cmd ~= "lazygit" then
					local opts = { noremap = true }
					vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
				end
			end,
		},
	},
}
