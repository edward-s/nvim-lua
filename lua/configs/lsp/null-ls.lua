local M = {}

local lsputils = require("configs.lsp.utils")
local null_ls = require("null-ls")

function M.setup()
  local formatting = null_ls.builtins.formatting
  local codeActions = null_ls.builtins.code_actions
  local sources = {
    formatting.prettierd,
    codeActions.eslint_d,
  }
  null_ls.setup({
    sources = sources,
    on_attach = lsputils.lsp_attach,
    capabilities = lsputils.get_capabilities(),
    flags = { debounce_text_changes = 150 },
  })
end

return M
