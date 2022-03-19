local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("configs.lsp.handlers").on_attach,
		capabilities = require("configs.lsp.handlers").capabilities,
	}

	server:setup(opts)
end)
