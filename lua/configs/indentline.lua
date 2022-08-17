local present, indent_blankline = pcall(require, "indent_blankline")
if not present then
	return
end

indent_blankline.setup({
	char = "▏",
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard", "NvimTree", "lspsagaoutline" },
	show_current_context = true,
	use_treesitter = true,
})
