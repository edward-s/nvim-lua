require("indent_blankline").setup({
	char = "▏",
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "NvimTree", "lspsagaoutline" },
	show_foldtext = false,
	context_char = "▎",
	char_priority = 12,
	show_current_context = true,
	show_current_context_start = true,
	show_current_context_start_on_current_line = false,
	show_first_indent_level = true,
})
