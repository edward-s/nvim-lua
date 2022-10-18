local dap = require("dap")

local dap_signs = {
	breakpoint = {
		text = "🛑",
		texthl = "LspDiagnosticsSignError",
		linehl = "",
		numhl = "",
	},
	rejected = {
		text = "",
		texthl = "LspDiagnosticsSignHint",
		linehl = "",
		numhl = "",
	},
}

vim.fn.sign_define("DapBreakpoint", dap_signs.breakpoint)
vim.fn.sign_define("DapBreakpointRejected", dap_signs.rejected)

vim.api.nvim_command("au FileType dap-repl lua require('dap.ext.autocompl').attach()")

require("nvim-dap-virtual-text").setup({
	all_frames = true,
	commented = true,
})
require("dapui").setup()

-- adapters
require("configs.dap.adapters.typescript")
require("configs.dap.adapters.go")
