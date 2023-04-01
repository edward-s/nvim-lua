local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
vim.g.mapleader = " "
vim.g.localmapleader = " "

-- Un-indent
keymap("i", "<S-Tab>", "<C-d>", opts)

-- Macro
keymap("n", "Q", "q", opts)
keymap("n", "q", "<Nop>", opts)

-- Split navigations
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<A-j>", ":resize -2<cr>", opts)
keymap("n", "<A-k>", ":resize +2<cr>", opts)
keymap("n", "<A-h>", ":vertical resize -2<cr>", opts)
keymap("n", "<A-l>", ":vertical resize +2<cr>", opts)

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Code folding
keymap("n", ",", "za", opts)
for _, key in pairs({
	"zo",
	"zO",
	"zc",
	"zC",
	"za",
	"zA",
	"zv",
	"zx",
	"zX",
	"zm",
	"zr",
}) do
	keymap("n", key, key .. "<cmd>IndentBlanklineRefresh<cr>", opts)
end
keymap("n", "zR", "<cmd>lua require('ufo').openAllFolds()<cr><cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zM", "<cmd>lua require('ufo').closeAllFolds()<cr><cmd>IndentBlanklineRefresh<cr>", opts)

-- Nvim tree
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require('configs.telescope').project_files()<cr>", opts)

-- Neotest
keymap("n", "[t", "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", opts)
keymap("n", "]t", "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", opts)

--Hlslens
keymap("n", "*", [[*<cmd>lua require('hlslens').start()<cr>]], opts)
keymap("n", "#", [[#<cmd>lua require('hlslens').start()<cr>]], opts)
keymap("n", "g*", [[g*<cmd>lua require('hlslens').start()<cr>]], opts)
keymap("n", "g#", [[g#<cmd>lua require('hlslens').start()<cr>]], opts)

--Lsp
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "gD", "<cmd>Lspsaga peek_definition<cr>", opts)
keymap("n", "gf", "<cmd>Lspsaga lsp_finder<cr>", opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
keymap("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
keymap("n", "gT", "<cmd>Lspsaga peek_type_definition<cr>", opts)
keymap("n", "gr", "<cmd>Lspsaga rename<cr>", opts)
keymap("n", "[w", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "]w", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap("n", "[e", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]e", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
