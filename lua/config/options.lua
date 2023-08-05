local options = {
	autoindent = true,
	background = "dark",
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = "menuone,noselect",
	conceallevel = 0,
	cursorline = true,
	expandtab = true,
	exrc = true,
	foldenable = true,
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevel = 99,
	foldlevelstart = 99,
	foldmethod = "expr",
	hidden = true,
	hlsearch = true,
	ignorecase = true,
	laststatus = 3,
	mouse = "a",
	number = true,
	relativenumber = true,
	shiftround = true,
	shiftwidth = 2,
	showmode = false,
	showtabline = 2,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	softtabstop = 2,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	title = true,
	undofile = true,
	wrap = true,
}

vim.opt.shortmess:append("c")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

for k, v in pairs(options) do
	vim.opt[k] = v
end
