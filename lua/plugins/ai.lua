return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
    -- stylua: ignore
    keys = {
      { "<leader>ac", "<cmd>ChatGPT<cr>", desc = "ChatGPT" },
      { "<leader>ac", ":ChatGPTRun", mode = "v", desc = "ChatGPT Run" },
      { "<leader>ae", function() require('chatgpt').edit_with_instructions() end, mode = "v", desc = "ChatGPT With Instructions" },
    },
		opts = {
			edit_with_instructions = {
				diff = true,
				keymaps = {
					close = "q",
					use_output_as_input = "<C-e>",
				},
			},
			chat = {
				keymaps = {
					close = "q",
				},
			},
			popup_input = {
				submit = "<Enter>",
				submit_n = "<Enter>",
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
