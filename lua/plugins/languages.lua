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
		config = function(_, opts)
      --stylua: ignore
      require("plugins.lsp.utils").on_attach(function(client, bufnr)
        if client.name == "typescript-tools" then
          vim.keymap.set("n", "<leader>lo", "<cmd>TSToolsOrganizeImports<cr>", { buffer = bufnr, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>lO", "<cmd>TSToolsSortImports<cr>", { buffer = bufnr, desc = "Sort Imports" })
          vim.keymap.set("n", "<leader>lu", "<cmd>TSToolsRemoveUnused<cr>", { buffer = bufnr, desc = "Removed Unused" })
          vim.keymap.set("n", "<leader>lz", "<cmd>TSToolsGoToSourceDefinition<cr>", { buffer = bufnr, desc = "Go To Source Definition" })
          vim.keymap.set("n", "<leader>lr", "<cmd>TSToolsRemoveUnusedImports<cr>", { buffer = bufnr, desc = "Removed Unused Imports" })
          vim.keymap.set("n", "<leader>lf", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
          vim.keymap.set("n", "<leader>la", "<cmd>TSToolsAddMissingImports<cr>", { buffer = bufnr, desc = "Add Missing Imports" })
        end
      end)
			require("typescript-tools").setup(opts)
		end,
	},
}
