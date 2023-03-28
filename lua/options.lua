local options = {
	autoindent = true,
	background = "dark",
	clipboard = "unnamedplus",
	completeopt = "menuone,noselect",
	cmdheight = 1,
	conceallevel = 0,
	cursorline = true,
	expandtab = true,
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
	updatetime = 250,
	wrap = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end
