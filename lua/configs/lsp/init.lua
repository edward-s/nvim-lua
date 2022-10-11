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
	local opts = {
		on_attach = lsputils.lsp_attach,
		capabilities = lsputils.get_capabilities(),
	}
	local has_custom_opts, server_opts = pcall(require, "configs.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_opts)
	end
	lspconfig[server].setup(opts)
end

require("configs.lsp.null-ls").setup()
