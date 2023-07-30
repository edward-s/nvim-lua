return {
	-- TypeScript
	{
		"pmizio/typescript-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
		},
		ft = {
			"typescript",
			"typescriptreact",
			"typescript.tsx",
			"javascript",
			"javascriptreact",
			"javascript.jsx",
		},
		opts = {},
		config = function(_, opts)
			require("typescript-tools").setup(opts)

			local wk = require("which-key")
			local bufNumber = vim.api.nvim_get_current_buf()

			vim.cmd("autocmd FileType typescript lua WhichKeyTypescript()")
			function WhichKeyTypescript()
				wk.register({
					["<leader>ct"] = {
						name = "Typescript",
						a = { "<cmd>TSToolsAddMissingImports<cr>", "Add Missing Imports" },
						d = { "<cmd>TSToolsGoToSourceDefinition<cr>", "Source Definition" },
						f = { "<cmd>TSToolsFixAll<cr>", "Fix All" },
						o = { "<cmd>TSToolsOrganizeImports<cr>", "Organize Imports" },
						s = { "<cmd>TSToolsSortImports<cr>", "Sort Imports" },
						u = { "<cmd>TSToolsRemoveUnused<cr>", "Remove Unused" },
					},
				}, { buffer = bufNumber })
			end
		end,
	},
}
