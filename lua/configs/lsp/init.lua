local M = {}

local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")
local lsputils = require("configs.lsp.utils")

local servers = { "tsserver", "jsonls", "sumneko_lua", "emmet_ls" }

lsp_installer.setup {
  ensure_installed = servers
}

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
