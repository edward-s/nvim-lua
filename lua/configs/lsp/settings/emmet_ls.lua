local M = {}

local lsputils = require("configs.lsp.utils")

function M.setup()
	local opts = {
		filetypes = { "html", "css", "scss", "typescriptreact", "javascriptreact" },
		capabilities = lsputils.get_capabilities(),
	}
	return opts
end

return M
