return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "javascript", "typescript", "tsx" })
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "typescript-language-server", "js-debug-adapter" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				eslint = {
					settings = {
						workingDirectory = { mode = "auto" },
					},
					root_dir = function(...)
						return require("lspconfig.util").root_pattern(".git")(...)
					end,
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
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tsserver = {
					settings = {
						typescript = {
							format = {
								indentSize = vim.o.shiftwidth,
								convertTabsToSpaces = vim.o.expandtab,
								tabSize = vim.o.tabstop,
							},
						},
						javascript = {
							format = {
								indentSize = vim.o.shiftwidth,
								convertTabsToSpaces = vim.o.expandtab,
								tabSize = vim.o.tabstop,
							},
						},
						completions = {
							completeFunctionCalls = true,
						},
					},
				},
			},
			setup = {
				tsserver = function()
					local lsp_utils = require("plugins.lsp.utils")
					lsp_utils.on_attach(function(client, buffer)
						if client.name == "tsserver" then
							vim.keymap.set("n", "<leader>la", function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { "source.addMissingImports.ts" },
										diagnostics = {},
									},
								})
							end, { buffer = buffer, desc = "Add missing imports" })
							vim.keymap.set("n", "<leader>lo", function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { "source.organizeImports.ts" },
										diagnostics = {},
									},
								})
							end, { buffer = buffer, desc = "Organize imports" })
							vim.keymap.set("n", "<leader>lf", function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { "source.fixAll.ts" },
										diagnostics = {},
									},
								})
							end, { buffer = buffer, desc = "Fix all" })
							vim.keymap.set("n", "<leader>lu", function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { "source.removeUnused.ts" },
										diagnostics = {},
									},
								})
							end, { buffer = buffer, desc = "Removed unused imports" })
						end
					end)
				end,
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		opts = function()
			local dap = require("dap")

			for _, adapter in ipairs({ "pwa-node", "pwa-chrome" }) do
				dap.adapters[adapter] = {
					type = "server",
					host = "localhost",
					port = "${port}",
					executable = {
						command = "js-debug-adapter",
						args = { "${port}" },
					},
				}
			end

			for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = vim.fn.getcwd(),
						skipFiles = { "<node_internals>/**" },
						sourceMaps = true,
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch File",
						cwd = vim.fn.getcwd(),
						args = { "${file}" },
						sourceMaps = true,
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = "Launch & Debug Chrome",
						url = function()
							local co = coroutine.running()
							return coroutine.create(function()
								vim.ui.input({
									prompt = "Enter URL: ",
									default = "http://localhost:8082",
								}, function(url)
									if url == nil or url == "" then
										return
									else
										coroutine.resume(co, url)
									end
								end)
							end)
						end,
						webRoot = vim.fn.getcwd(),
						protocol = "inspector",
						sourceMaps = true,
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = "React Native (Chrome Debugger)",
						url = "http://localhost:8081/debugger-ui",
						webRoot = vim.fn.getcwd(),
						protocol = "inspector",
						sourceMaps = true,
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
