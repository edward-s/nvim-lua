local M = {}

local lsputils = require("configs.lsp.utils")
local typescript = require("typescript")

function M.setup()
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
