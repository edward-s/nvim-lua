return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		opts = {
			servers = {
				graphql = {},
				html = {},
				prismals = {},
				bashls = {},
			},
		},
		config = function(plugin, opts)
			require("plugins.lsp.servers").setup(plugin, opts)
			require("plugins.lsp.format").setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
		},
		cmd = "Mason",
		keys = { { "<leader>zm", "<cmd>Mason<cr>", desc = "Mason" } },
		opts = {
			ensure_installed = {
				"stylua",
				"eslint_d",
				"prettierd",
			},
		},
		config = function(_, opts)
			require("mason").setup()
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
			require("mason-nvim-dap").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xQ", "<cmd>Trouble quickfix<cr>", desc = "Quickfix List (Trouble)" },
			{ "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
			{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ui = {
				title = false,
				border = "rounded",
			},
			lightbulb = {
				enable = false,
			},
			finder = {
				keys = {
					toggle_or_open = "<Enter>",
				},
			},
			rename = {
				keys = {
					quit = "q",
				},
			},
		},
	},
}
