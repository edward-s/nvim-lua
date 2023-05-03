local options = {
	autoindent = true,
	background = "dark",
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = "menuone,noselect",
	conceallevel = 0,
	cursorline = true,
	expandtab = true,
	foldlevel = 99,
	foldlevelstart = 99,
	foldnestmax = 0,
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
	updatetime = 300,
	wrap = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end
