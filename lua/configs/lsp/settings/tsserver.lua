local M = {}

local lsputils = require("configs.lsp.utils")

function M.setup()
	M.keymappings()

	local typescript = require("typescript")
	typescript.setup({
		disable_commands = false,
		debug = false,
		server = {
			on_attach = lsputils.lsp_attach,
			capabilities = lsputils.get_capabilities(),
		},
	})
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

	local wk = require("which-key")
	local mappings = {
		["T"] = {
			name = "Typescript",
			f = {
				"<cmd>TypescriptFixAll<cr>",
				"Fix all",
			},
			i = {
				"<cmd>TypescriptAddMissingImports<cr>",
				"Add Missing Imports",
			},
			o = {
				"<cmd>TypescriptOrganizeImports<cr>",
				"Organize Imports",
			},
		},
	}
	wk.register(mappings, opts)
end

return M
