return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "▏",
		},
		scope = {
			show_start = false,
			show_end = false,
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
