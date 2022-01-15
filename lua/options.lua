local options = {
	clipboard = "unnamedplus",
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	splitbelow = true,
	splitright = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	number = true,
	relativenumber = true,
	wrap = false,
	hidden = true,
	termguicolors = true,
	updatetime = 300,
	signcolumn = "yes",
	swapfile = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end
