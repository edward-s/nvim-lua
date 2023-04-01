local M = {}

function M.lsp_diagnostics()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
		},
		diagnostic = {
			signs = {
				active = signs,
			},
			virtual_text = false,
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

function M.format()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.bo[buf].filetype
	local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

	vim.lsp.buf.format({
		bufnr = buf,
		filter = function(client)
			if have_nls then
				return client.name == "null-ls"
			end
			return client.name ~= "null-ls"
		end,
	})
end

function M.lsp_format(client, buf)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormat." .. buf, {}),
			buffer = buf,
			callback = function()
				M.format()
			end,
		})
	end
end

function M.lsp_attach(client, bufnr)
	M.lsp_format(client, bufnr)
	M.lsp_diagnostics()
end

function M.get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

return M
