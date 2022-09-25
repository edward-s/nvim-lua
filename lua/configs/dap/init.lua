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

-- debuggers
require("dap-vscode-js").setup({
	debugger_path = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter",
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Debug Jest Tests",
			-- trace = true, -- include debugger info
			runtimeExecutable = "node",
			runtimeArgs = {
				"./node_modules/jest/bin/jest.js",
				"--runInBand",
			},
			rootPath = "${workspaceFolder}",
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
			internalConsoleOptions = "neverOpen",
		},
	}
end
