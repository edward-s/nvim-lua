local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local servers = { "tsserver", "jsonls", "sumneko_lua" }

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
		local opts = server_settings.setup()
		if opts ~= nil then
			lspconfig[server].setup(opts)
		end
	end
end

require("configs.lsp.null-ls").setup()
