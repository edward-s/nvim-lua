return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mxsdev/nvim-dap-vscode-js",
		},
  -- stylua: ignore
  keys = {
    { "<leader>e", function() require("dapui").eval() end, desc = "Dap Eval" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dx", function() require("dap").clear_breakpoints() end, desc = "Clear breakpoints" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dd", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variables" },
    { "<leader>du", function() require("dapui").toggle() end, desc = "Dap UI" },
    { "<leader>di", function() require("dap.ui.widgets").step_into() end, desc = "Step Into" },
    { "<leader>do", function() require("dap.ui.widgets").step_out() end, desc = "Step Out" },
    { "<leader>ds", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dq", function() require("dap").terminate() end, desc = "Terminate" },
  },
		opts = {
			setup = {
				javascript = function(_, _)
					require("plugins.dap.javascript").setup()
				end,
			},
		},
		config = function(plugin, opts)
			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "error", linehl = "", numhl = "" })

			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				vim.cmd(":Neotree close")
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			for k, _ in pairs(opts.setup) do
				opts.setup[k](plugin, opts)
			end
		end,
	},
}
