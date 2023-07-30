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
						a = { "<Cmd>TSToolsAddMissingImports<CR>", "Add Missing Imports" },
						d = { "<Cmd>TSToolsGoToSourceDefinition<CR>", "Source Definition" },
						f = { "<Cmd>TSToolsFixAll<CR>", "Fix All" },
						o = { "<Cmd>TSToolsOrganizeImports<CR>", "Organize Imports" },
						s = { "<Cmd>TSToolsSortImports<CR>", "Sort Imports" },
						u = { "<Cmd>TSToolsRemoveUnused<CR>", "Remove Unused" },
					},
				}, { buffer = bufNumber })
			end
		end,
	},
}
