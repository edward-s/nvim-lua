local options = {
	clipboard = "unnamedplus",
	completeopt = "menu,menuone,noselect",
	conceallevel = 0,
	cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	foldenable = false,
	foldexpr = "nvim_treesitter#foldexpr()",
	foldmethod = "expr",
	hidden = true,
	hlsearch = true,
	ignorecase = true,
	-- laststatus = 3,
	mouse = "a",
	number = true,
	relativenumber = true,
	shiftwidth = 2,
	showmode = false,
	showtabline = 2,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	updatetime = 250,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end
