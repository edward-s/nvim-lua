local M = {}

local lsputils = require "configs.lsp.utils"

function M.lsp_attach(client)
  lsputils.lsp_attach(client)

  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local ts_utils = require "nvim-lsp-ts-utils"

  ts_utils.setup({
    enable_import_on_completion = true,
    always_organize_imports = false,
    update_imports_on_move = true,
  })

  ts_utils.setup_client(client)
end

function M.config()
  return {
    on_attach = M.lsp_attach,
    capabilities = lsputils.get_capabilities(),
  }
end

function M.setup()
  M.keymappings()
  return M.config()
end

function M.keymappings()
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }

  local wk = require "which-key"
  local mappings = {
    ["T"] = {
      name = "Typescript",
      i = {
        "<cmd>TSLspImportAll<cr>",
        "Import All",
      },
      o = {
        "<cmd>TSLspOrganize<cr>",
        "Organize Imports",
      },
    },
  }
  wk.register(mappings, opts)
end

return M
