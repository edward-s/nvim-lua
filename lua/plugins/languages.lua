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
		opts = {
			settings = {
				complete_function_calls = true,
			},
		},
		keys = {
			{ "<leader>lta", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
			{ "<leader>ltd", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to Source Definition" },
			{ "<leader>ltf", "<cmd>TSTSToolsFixAll<cr>", desc = "Fix All" },
			{ "<leader>lto", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
			{ "<leader>lts", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports" },
			{ "<leader>ltu", "<cmd>TSToolsRemoveUnused<cr>", desc = "Remove Unused" },
		},
	},
}
