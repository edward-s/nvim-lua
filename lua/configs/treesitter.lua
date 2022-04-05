local present, ts_configs = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

ts_configs.setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
