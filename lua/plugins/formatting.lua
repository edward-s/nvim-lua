return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		lazy = true,
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Format",
			},
		},
		opts = {
			format = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
			},
			formatters_by_ft = {
				["css"] = { "prettier" },
				["graphql"] = { "prettier" },
				["handlebars"] = { "prettier" },
				["html"] = { "prettier" },
				["javascript"] = { "prettier" },
				["javascriptreact"] = { "prettier" },
				["json"] = { "prettier" },
				["jsonc"] = { "prettier" },
				["less"] = { "prettier" },
				["lua"] = { "stylua" },
				["markdown"] = { "prettier" },
				["markdown.mdx"] = { "prettier" },
				["scss"] = { "prettier" },
				["typescript"] = { "prettier" },
				["typescriptreact"] = { "prettier" },
				["vue"] = { "prettier" },
				["yaml"] = { "prettier" },
			},
			formatters = {
				injected = { options = { ignore_errors = true } },
			},
		},
	},
}
