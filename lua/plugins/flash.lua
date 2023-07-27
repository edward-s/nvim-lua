return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = {
				enabled = false,
			},
		},
	},
  -- stylua: ignore
  keys = {
    { "<C-s>", mode = { "n", "o", "x" }, function() vim.cmd("silent! lua require('flash').treesitter()") end, desc = "Flash Treesitter" },
  },
}
