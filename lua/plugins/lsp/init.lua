return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			{
				"j-hui/fidget.nvim",
				opts = {
					sources = {
						["null-ls"] = {
							ignore = true,
						},
					},
				},
			},
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"jay-babu/mason-null-ls.nvim",
			"jose-elias-alvarez/typescript.nvim",
		},
		opts = {
			servers = {
				jsonls = {},
				tsserver = {
					settings = {
						completions = {
							completeFunctionCalls = true,
						},
					},
				},
			},
			setup = {
				tsserver = function(_, opts)
					require("plugins.lsp.utils").on_attach(function(client)
            -- stylua: ignore
						if client.name == "tsserver" then
              vim.keymap.set("n", "<leader>cA", "<cmd>TypescriptFixAll<cr>", { desc = "Fix All"  })
              vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<cr>", { desc = "Rename File"  })
              vim.keymap.set("n", "<leader>cm", "<cmd>TypescriptAddMissingImports<cr>", { desc = "Add Missing Imports"  })
              vim.keymap.set("n", "<leader>cu", "<cmd>TypescriptRemoveUnused<cr>", { desc = "Remove Unused"  })
						end
					end)
					require("typescript").setup({ server = opts })
					return true
				end,
			},
		},
		config = function(plugin, opts)
			require("plugins.lsp.servers").setup(plugin, opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>zm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"typescript-language-server",
			},
		},
		config = function(_, opts)
			require("mason").setup()
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		config = function()
			local nls = require("null-ls")
			local formatting = nls.builtins.formatting
			local codeActions = nls.builtins.code_actions
			nls.setup({
				sources = {
					formatting.prettierd,
					formatting.stylua,
					codeActions.eslint_d,
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = { ensure_installed = nil, automatic_installation = true, automatic_setup = false },
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>cd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
			{ "<leader>cD", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
		},
	},
	{
		"glepnir/lspsaga.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ui = {
				title = false,
				border = "rounded",
			},
			rename = {
				quit = "q",
			},
			finder = {
				keys = {
					expand_or_jump = "<Enter>",
				},
			},
		},
	},
}
