local M = {}

function M.nvim_dap_setup()
	-- DAPInstall
	-- local dap_install = require("dap-install")
	-- dap_install.setup({
	-- 	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	-- })
	-- dap_install.config("jsnode", {})
	--
	-- -- telescope-dap
	-- -- require("telescope").load_extension("dap")
	--
	-- nvim-dap-ui

	-- languages
	require("configs.dap.node").setup()
	require("dapui").setup()
	-- require("configs.dap.typescript").setup()
	--
	-- dap_install.config("jsnode", {})
	-- local dap = require("dap")
	-- dap.adapters.node2 = {
	-- 	type = "executable",
	-- 	command = "node",
	-- 	args = {
	-- 		vim.fn.stdpath("data") .. "/dapinstall/jsnode/" .. "/vscode-node-debug2/out/src/nodeDebug.js",
	-- 	},
	-- }
	-- dap.configurations.typescript = {
	-- 	{
	-- 		name = "Run",
	-- 		type = "node2",
	-- 		request = "launch",
	-- 		program = "${file}",
	-- 		cwd = vim.fn.getcwd(),
	-- 		sourceMaps = true,
	-- 		protocol = "inspector",
	-- 		console = "integratedTerminal",
	-- 	},
	-- 	{
	-- 		name = "Attach to process",
	-- 		type = "node2",
	-- 		request = "attach",
	-- 		processId = require("dap.utils").pick_process,
	-- 	},
	-- }

	-- nvim-dap
	vim.fn.sign_define("DapBreakpoint", { text = "??", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "??", texthl = "", linehl = "", numhl = "" })
end

function M.setup()
	M.nvim_dap_setup()
end

return M
