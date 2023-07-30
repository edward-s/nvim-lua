return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
        -- stylua: ignore
        keys = {
          { "<leader>e", function() require("dapui").eval() end, desc = "Dap Eval" },
          { "<leader>du", function() require("dapui").toggle() end, desc = "Dap UI" },
        },
				config = function()
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup()

					dap.listeners.after.event_initialized["dapui_config"] = function()
						vim.cmd("NvimTreeClose")
						vim.defer_fn(function()
							dapui.open()
						end, 200)
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
				end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {
					commented = true,
				},
			},
			"mxsdev/nvim-dap-vscode-js",
		},
  -- stylua: ignore
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dx", function() require("dap").clear_breakpoints() end, desc = "Clear breakpoints" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dd", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
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

			for k, _ in pairs(opts.setup) do
				opts.setup[k](plugin, opts)
			end
		end,
	},
}
