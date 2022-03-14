local present, null_ls = pcall(require, "null-ls")
if not present then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local codeActions = null_ls.builtins.code_actions

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.stylua,
		codeActions.eslint,
		diagnostics.eslint,
	},
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
