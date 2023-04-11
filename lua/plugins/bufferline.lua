return {
	{
		"akinsho/nvim-bufferline.lua",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
		},
		opts = {
			options = {
				mode = "buffers",
				diagnostics = false,
				separator_style = "thin",
				show_tab_indicators = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
				offsets = { { filetype = "NvimTree", text = "" } },
			},
		},
	},
}
