local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("configs.lsp.handlers").on_attach,
		capabilities = require("configs.lsp.handlers").capabilities,
		flags = {
			debounce_text_changes = 150,
		},
	}

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("configs.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	server:setup(opts)
end)
