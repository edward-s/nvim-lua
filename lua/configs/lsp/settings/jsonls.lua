local M = {}

local lsputils = require "configs.lsp.utils"

function M.setup()
  local opts = {
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        format = { enable = false },
      },
    },
    on_attach = lsputils.lsp_attach,
    capabilities = lsputils.get_capabilities(),
    flags = { debounce_text_changes = 150 },
  }
  return opts
end

return M
