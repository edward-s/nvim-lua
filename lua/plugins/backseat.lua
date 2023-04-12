return {
	"james1236/backseat.nvim",
	cmd = "Backseat",
	keys = {
		{ "<leader>za", "<cmd>Backseat<cr>", desc = "AI Code Suggestions" },
		{ "\\", "<cmd>BackseatClearLine<cr>", desc = "Clear AI Code Suggestion(Line)" },
		{ "<leader>zc", "<cmd>BackseatClear<cr>", desc = "Clear AI Code Suggestion(Buffer)" },
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
