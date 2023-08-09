return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "<leader>ac", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
      { "<leader>ae", function() require('chatgpt').edit_with_instructions() end, mode = "v", desc = "ChatGPT With Instructions" },
    },
		opts = {
			edit_with_instructions = {
				diff = true,
			},
			chat = {
				keymaps = {
					close = "q",
				},
			},
			openai_params = {
				model = "gpt-3.5-turbo",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 3000,
				temperature = 0,
				top_p = 1,
				n = 1,
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
