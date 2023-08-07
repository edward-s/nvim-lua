return {
	"stevearc/dressing.nvim",
	opts = {
		input = {
			insert_only = false,
			mappings = {
				n = {
					["q"] = "Close",
				},
			},
		},
	},
	event = { "VeryLazy" },
}
