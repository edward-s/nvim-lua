local options = {
	clipboard = "unnamedplus",
	completeopt = "menu,menuone,noselect",
	conceallevel = 0,
	cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	foldlevel = 99,
	foldexpr = "nvim_treesitter#foldexpr()",
	foldmethod = "expr",
	hidden = true,
	hlsearch = true,
	ignorecase = true,
	laststatus = 3,
	mouse = "a",
	number = true,
	relativenumber = true,
	shiftwidth = 2,
	showmode = false,
	showtabline = 2,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	updatetime = 250,
	wrap = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end
