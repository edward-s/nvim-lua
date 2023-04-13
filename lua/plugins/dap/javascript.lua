local M = {}

function M.setup()
	local dap = require("dap")

	require("dap-vscode-js").setup({
		debugger_path = os.getenv("HOME") .. "/.local/share/nvim/vscode-js-debug",
		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
	})

	for _, language in ipairs({ "javascript", "typescript" }) do
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

	for _, language in ipairs({ "typescriptreact", "javascriptreact" }) do
		require("dap").configurations[language] = {
			{
				type = "pwa-chrome",
				name = "Attach - Remote Debugging",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
				port = 9222,
				webRoot = "${workspaceFolder}",
			},
			{
				type = "pwa-chrome",
				name = "Launch Chrome",
				request = "launch",
				url = "http://localhost:3000",
			},
		}
	end
end

return M