local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local lsp = {
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
		},
		diagnostic = {
			virtual_text = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
			},
		},
	}

	vim.diagnostic.config(lsp.diagnostic)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp.float)
end

M.on_attach = function(client)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		local ts_utils = require("nvim-lsp-ts-utils")

		ts_utils.setup({
			enable_import_on_completion = true,
			always_organize_imports = false,
			update_imports_on_move = true,
		})
		ts_utils.setup_client(client)
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
