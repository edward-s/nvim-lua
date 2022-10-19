local present, toggleterm = pcall(require, "toggleterm")
if not present then
	return
end

toggleterm.setup({
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
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
