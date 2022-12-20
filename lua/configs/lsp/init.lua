local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local lsputils = require("configs.lsp.utils")
local servers = { "tsserver", "jsonls", "sumneko_lua", "gopls", "html" }

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local has_settings, server_settings = pcall(require, "configs.lsp.settings." .. server)
	if has_settings then
		local server_opts = server_settings.setup()
		if server_opts ~= nil then
			lspconfig[server].setup(server_opts)
		end
	else
		local opts = {
			on_attach = lsputils.lsp_attach,
			capabilities = lsputils.get_capabilities(),
		}
		lspconfig[server].setup(opts)
	end
end

require("lsp_signature").setup({
	bind = true,
	handler_opts = {
		border = "rounded",
	},
	hint_enable = false,
})

require("configs.lsp.null-ls").setup()
