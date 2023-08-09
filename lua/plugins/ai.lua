return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "<leader>ac", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
    },
		opts = {
			chat = {
				keymaps = {
					close = "q",
				},
			},
		},
		config = function(_, opts)
			require("chatgpt").setup(opts)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
