return {
	"james1236/backseat.nvim",
	cmd = "Backseat",
	keys = {
		{ "<leader>za", "<cmd>Backseat<cr>", desc = "AI Suggestions" },
		{ "<M-bs>", "<cmd>BackseatClear<cr>", desc = "Clear AI Suggestions" },
		{ "<bs>", "<cmd>BackseatClearLine<cr>", desc = "Clear AI Suggestion" },
	},
	config = function()
		require("backseat").setup({
			openai_model_id = "gpt-3.5-turbo",
			highlight = {
				icon = "",
				group = "Comment",
			},
		})
	end,
}
