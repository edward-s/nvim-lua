local M = {}

function M.setup()
	local dap = require("dap")

	dap.adapters.node2 = {
		type = "executable",
		command = "node",
		-- command = os.getenv("HOME") .. "/.nvm/versions/node/v12.22.1/bin/node",
		args = { os.getenv("HOME") .. "/.local/share/nvim/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js" },
	}

	dap.configurations.typescript = {
		-- {
		-- 	name = "Launch",
		-- 	type = "node2",
		-- 	request = "launch",
		-- 	cwd = vim.fn.getcwd(),
		-- 	sourceMaps = true,
		-- 	protocol = "inspector",
		-- 	console = "integratedTerminal",
		-- 	outFiles = { "${workspaceFolder}/build/**/*.js" },
		-- },
		{
			-- For this to work you need to make sure the node process is started with the `--inspect` flag.
			name = "Attach to process",
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
