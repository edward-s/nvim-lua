return {
	{
		"akinsho/nvim-bufferline.lua",
		lazy = false,
		keys = {
			{ "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
		},
		opts = {
			options = {
				mode = "tabs",
				show_tab_indicators = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				always_show_bufferline = false,
			},
		},
	},
}
