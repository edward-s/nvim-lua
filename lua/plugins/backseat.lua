return {
	"james1236/backseat.nvim",
	cmd = "Backseat",
	keys = {
		{ "<leader>zc", "<cmd>Backseat<cr>", desc = "AI Code Suggestions" },
		{ "<leader>zC", "<cmd>BackseatClear<cr>", desc = "Clear AI Code Suggestions" },
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
