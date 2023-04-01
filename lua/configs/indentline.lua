require("indent_blankline").setup({
	char = "▏",
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "NvimTree", "swift" },
	show_foldtext = false,
	context_char = "▎",
	show_current_context = true,
})
