require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp",
		separator_style = "thin",
		show_tab_indicators = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
	},
})
