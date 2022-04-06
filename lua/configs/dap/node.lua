local M = {}

function M.setup()
	local dap = require("dap")

	dap.adapters.node2 = {
		type = "executable",
		command = "node",
		args = {
			vim.fn.stdpath("data") .. "/dapinstall/jsnode/" .. "/vscode-node-debug2/out/src/nodeDebug.js",
		},
	}

	dap.configurations.javascript = {
		{
			type = "node2",
			name = "node attach",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
		},
		{
			type = "node2",
			name = "node launch",
			request = "launch",
			program = "${workspaceFolder}/${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			protocol = "inspector",
		},
	}

	dap.configurations.typescript = {
		{
			name = "node attach",
			type = "node2",
			request = "attach",
			program = "${file}",
			cwd = vim.fn.getcwd(),
			sourceMaps = true,
			protocol = "inspector",
		},
	}
end

return M
