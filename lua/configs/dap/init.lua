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

local dapui = require("dapui")
dapui.setup({
	layouts = {
		{
			elements = {
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
			},
			size = 0.25,
			position = "bottom",
		},
	},
})

-- adapters
require("configs.dap.adapters.typescript")
require("configs.dap.adapters.go")
