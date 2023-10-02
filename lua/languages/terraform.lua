vim.api.nvim_create_autocmd("FileType", {
	pattern = { "hcl", "terraform" },
	desc = "terraform/hcl commentstring configuration",
	command = "setlocal commentstring=#\\ %s",
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, {
					"terraform",
					"hcl",
				})
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				terraformls = {},
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			if type(opts.sources) == "table" then
				local nls = require("null-ls")
				vim.list_extend(opts.sources, {
					nls.builtins.formatting.terraform_fmt,
					nls.builtins.diagnostics.terraform_validate,
				})
			end
		end,
	},
}
