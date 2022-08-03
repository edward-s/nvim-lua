local M = {}

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local lsputils = require("configs.lsp.utils")
local tsserver = require("configs.lsp.settings.tsserver")

tsserver.setup()

local servers = { "jsonls", "sumneko_lua" }

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
	local opts = {
		on_attach = M.lsp_attach,
		capabilities = lsputils.get_capabilities(),
	}

	local has_custom_opts, server_settings = pcall(require, "configs.lsp.settings." .. server)
	if has_custom_opts then
		opts = server_settings.setup()
	end
	lspconfig[server].setup(opts)
end

require("configs.lsp.null-ls").setup()
