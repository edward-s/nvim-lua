require("indent_blankline").setup({
	char = "▏",
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "NvimTree", "lspsagaoutline" },
	show_foldtext = false,
	context_char = "▎",
	char_priority = 12,
	show_current_context = true,
})
