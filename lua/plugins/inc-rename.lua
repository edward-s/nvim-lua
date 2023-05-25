return {
	"smjonas/inc-rename.nvim",
	qvent = { "BufReadPost", "BufNewFile" },
	keys = {
		{ "gr", ":IncRename ", desc = "Rename" },
	},
	config = function()
		require("inc_rename").setup()
	end,
}
