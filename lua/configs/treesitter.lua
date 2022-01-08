local present, ts_configs = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

ts_configs.setup({
	ensure_installed = {
		"html",
		"css",
		"lua",
		"javascript",
		"typescript",
		"tsx",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	autopairs = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
})
