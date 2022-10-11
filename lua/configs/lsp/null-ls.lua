local M = {}

local lsputils = require("configs.lsp.utils")
local null_ls = require("null-ls")

function M.setup()
	local formatting = null_ls.builtins.formatting
	local codeActions = null_ls.builtins.code_actions
	local diagnostics = null_ls.builtins.diagnostics
	local sources = {
		formatting.prettierd,
		formatting.stylua,
		formatting.gofmt,
		codeActions.eslint_d,
		diagnostics.golangci_lint,
		diagnostics.eslint_d,
	}
	null_ls.setup({
		sources = sources,
		on_attach = lsputils.lsp_attach,
		capabilities = lsputils.get_capabilities(),
	})
end

return M
