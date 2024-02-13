return {
	{
		"zbirenbaum/copilot.lua",
		build = ":Copilot auth",
		event = { "InsertEnter" },
		opts = {
			panel = {
				auto_refresh = true,
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-e>",
					next = "<C-j>",
					prev = "<C-k>",
				},
			},
		},
		config = function(_, opts)
			require("copilot").setup(opts)

			local wk = require("which-key")
      -- stylua: ignore
			wk.register({
				["<leader>cc"] = {
					name = "+Copilot",
					p = { function() require("copilot.panel").open() end, desc = "Copilot panel", "Panel" },
				},
			})
		end,
	},
	{
		"jellydn/CopilotChat.nvim",
		dependencies = { "zbirenbaum/copilot.lua" },
		opts = {
			show_help = "no",
			debug = false,
			prompts = {
				Explain = "Explain how it works.",
				Review = "Review the following code and provide concise suggestions.",
				Tests = "Briefly explain how the selected code works, then generate unit tests.",
				Refactor = "Refactor the code to improve clarity and readability.",
			},
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
    -- stylua: ignore
		keys = {
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
      { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
			{ "<leader>ccv", ":CopilotChatVisual", mode = "x", desc = "CopilotChat - Open in vertical split" },
			{ "<leader>ccx", ":CopilotChatInPlace<cr>", mode = "x", desc = "CopilotChat - Run in-place code" },
      {
         "<leader>cci",
         function()
           local input = vim.fn.input("Ask Copilot: ")
           if input ~= "" then
             vim.cmd("CopilotChat " .. input)
           end
         end,
         desc = "CopilotChat - Ask input",
       },
		},
	},
}
