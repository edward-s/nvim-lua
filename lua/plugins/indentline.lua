return {
	"lukas-reineke/indent-blankline.nvim",
	branch = "v3",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "▏",
		},
		scope = {
			show_start = false,
			exclude = { "NvimTree", "Trouble", "lazy" },
		},
	},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
