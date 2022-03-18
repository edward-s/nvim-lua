local options = {
	clipboard = "unnamedplus",
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	conceallevel = 0,
	splitbelow = true,
	splitright = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	showtabline = 2,
	number = true,
	relativenumber = true,
	wrap = false,
	hidden = true,
	termguicolors = true,
	updatetime = 250,
	signcolumn = "yes",
	swapfile = false,
	cursorline = true,
	showmode = false,
	sidescrolloff = 8,
	smartcase = true,
	foldenable = false,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end
