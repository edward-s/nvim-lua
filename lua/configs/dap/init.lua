local M = {}

function M.setup()
	-- DAPInstall
	local dap_install = require("dap-install")
	dap_install.setup({
		installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	})

	require("telescope").load_extension("dap")
	require("dapui").setup()

	-- languages
	require("configs.dap.node").setup()

	-- nvim-dap
	vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
end

return M
