local present, lualine = pcall(require, "lualine")
if not present then
	return
end

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		always_divide_middle = true,
	},
})
