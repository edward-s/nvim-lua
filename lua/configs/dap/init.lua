local M = {}

function M.nvim_dap_setup()
	-- DAPInstall
	local dap_install = require("dap-install")
	dap_install.setup({
		installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	})

	-- telescope-dap
	-- require("telescope").load_extension("dap")

	-- nvim-dap-ui
	-- require("dapui").setup({})

	-- languages
	require("configs.dap.node").setup()
	require("configs.dap.typescript").setup()

	-- nvim-dap
	vim.fn.sign_define("DapBreakpoint", { text = "??", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "??", texthl = "", linehl = "", numhl = "" })

	vim.g.vimspector_enable_mappings = ""
end

function M.vimspector_setup()
	vim.g.vimspector_enable_mappings = "HUMAN"

	vim.g.vimspector_install_gadgets = {
		"debugpy",
		"vscode-go",
		"CodeLLDB",
		"vscode-node-debug2",
		"local-lua-debugger-vscode",
	}
	vim.cmd([[packadd! vimspector]])
end

function M.setup()
	M.nvim_dap_setup()
	-- M.vimspector_setup()
end

return M
