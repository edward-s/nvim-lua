local present, toggleterm = pcall(require, "toggleterm")
if not present then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<C-t>]],
	close_on_exit = true,
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	direction = "float",
	on_open = function()
		local opts = { noremap = true }
		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
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

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	count = 10,
	on_open = function(term)
		vim.cmd("startinsert!")
		if vim.fn.mapcheck("<esc>", "t") ~= "" then
			vim.api.nvim_buf_del_keymap(term.bufnr, "t", "<esc>")
		end
	end,
})

function _lazygit_toggle()
	lazygit:toggle()
end
