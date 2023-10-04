return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				eslint = {
					settings = {
						-- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
						workingDirectory = { mode = "auto" },
					},
				},
			},
			setup = {
				eslint = function()
					vim.api.nvim_create_autocmd("BufWritePre", {
						callback = function(event)
							if require("lspconfig.util").get_active_client_by_name(event.buf, "eslint") then
								vim.cmd("EslintFixAll")
							end
						end,
					})
				end,
			},
		},
	},
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
		},
		opts = {
			filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
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
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			if type(opts.sources) == "table" then
				local nls = require("null-ls")
				table.insert(opts.sources, {
					nls.builtins.formatting.prettierd,
					nls.builtins.code_actions.eslint_d,
				})
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mxsdev/nvim-dap-vscode-js",
		},
		opts = function()
			local dap = require("dap")

			require("dap-vscode-js").setup({
				debugger_path = os.getenv("HOME") .. "/.local/share/nvim/vscode-js-debug",
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Current File (pwa-node)",
						cwd = vim.fn.getcwd(),
						args = { "${file}" },
						sourceMaps = true,
						protocol = "inspector",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach Program (pwa-node)",
						cwd = vim.fn.getcwd(),
						skipFiles = { "<node_internals>/**" },
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch Chrome",
						url = "http://localhost:3000",
						webRoot = "${workspaceFolder}",
					},
				}
			end

			require("dap.ext.vscode").load_launchjs(nil, {
				["pwa-node"] = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
				["pwa-chrome"] = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
			})
		end,
	},
}
