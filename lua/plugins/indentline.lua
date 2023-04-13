return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		char = "▏",
		buftype_exclude = { "terminal" },
		filetype_exclude = { "dashboard", "NvimTree", "Trouble", "lazy" },
		context_char = "▎",
		show_current_context = true,
	},
}