return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		{ "<leader>m", "<cmd>TSJToggle<cr>", desc = "Join/Split Lines" },
	},
	opts = {
		use_default_keymaps = false,
	},
	config = function(_, opts)
		require("treesj").setup(opts)
	end,
}
