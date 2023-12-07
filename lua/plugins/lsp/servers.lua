local M = {}

local lsp_utils = require("plugins.lsp.utils")
local lspconfig = require("lspconfig")

local function lsp_init()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	-- LSP handlers configuration
	local config = {
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
		},
		diagnostic = {
			virtual_text = false,
			signs = {
				active = signs,
			},
			underline = false,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		},
	}

	vim.diagnostic.config(config.diagnostic)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)
end

function M.setup(_, opts)
	lsp_utils.on_attach(function(client, buffer)
		require("plugins.lsp.keymaps").on_attach(client, buffer)
	end)

	lsp_init()

	local servers = opts.servers
	require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
	require("mason-lspconfig").setup_handlers({
		function(server)
			local server_opts = servers[server] or {}
			server_opts.capabilities = lsp_utils.capabilities()
			lspconfig[server].setup(server_opts)
		end,
		["tsserver"] = function()
			lspconfig.tsserver.setup({
				-- typescript is handled by typescript-tools.nvim
				filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
			})
		end,
	})
end

return M
