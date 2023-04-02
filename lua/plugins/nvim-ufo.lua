return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	event = "BufRead",
  -- stylua: ignore
  keys = {
    { "zR", function() require('ufo').openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require('ufo').closeAllFolds() end, desc = "Close all folds" },
    { "zZ", function() require('ufo').peekFoldedLinesUnderCursor() end, desc = "Peed folded lines under cursor" },
  },
	config = true,
}
