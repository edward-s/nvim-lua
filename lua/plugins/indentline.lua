return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "VimEnter" },
	opts = {
		char = "▏",
		filetype_exclude = { "NvimTree", "Trouble", "lazy", "mason", "help" },
		show_trailing_blankline_indent = false,
		show_current_context = false,
	},
}
