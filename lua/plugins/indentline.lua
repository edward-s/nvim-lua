return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "VimEnter" },
	opts = {
		char = "▏",
		buftype_exclude = { "terminal" },
		filetype_exclude = { "NvimTree", "Trouble", "lazy" },
		context_char = "▎",
		char_priority = 50,
	},
}
