return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
	},
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{
		"nvim-tree/nvim-web-devicons",
		dependencies = { "DaikyXendo/nvim-material-icon" },
		config = function()
			require("nvim-web-devicons").setup({
				override = require("nvim-material-icon").get_icons(),
			})
		end,
	},
	{ "tpope/vim-surround", event = "BufReadPre" },
	{ "tpope/vim-unimpaired", event = "BufReadPre" },
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		keys = { "gb", "gc", "gcc", "gbc" },
		config = function(_, _)
			local opts = {
				ignore = "^$",
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
			require("Comment").setup(opts)
		end,
	},
	{
    --stylua: ignore
		keys = { { "<leader>ba", "<cmd>silent BufOnly<cr>", desc = "Close Other Buffers" } },
		"schickling/vim-bufonly",
	},
	{
    --stylua: ignore
		keys = { { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete Buffer" } },
		"famiu/bufdelete.nvim",
	},
}
