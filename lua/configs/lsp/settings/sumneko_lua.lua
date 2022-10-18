local M = {}

local lsputils = require("configs.lsp.utils")

function M.setup()
	local opts = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim", "use", "unpack", "require" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 1000,
				},
			},
		},
		on_attach = lsputils.lsp_attach,
		capabilities = lsputils.get_capabilities(),
	}
	return opts
end

return M
