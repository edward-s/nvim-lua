local M = {}

local lsputils = require("configs.lsp.utils")

function M.setup()
	local typescript = require("typescript")
	typescript.setup({
		disable_commands = false,
		debug = false,
		server = {
			on_attach = lsputils.lsp_attach,
			capabilities = lsputils.get_capabilities(),
		},
	})
end

return M
