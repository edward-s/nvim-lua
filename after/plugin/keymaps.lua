local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "

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

-- Use Esc to quit builtin terminal
keymap("t", "<Esc>", [[<c-\><c-n>]], opts)

-- Code folding
keymap("n", ",", "za", opts)
keymap("n", "zc", "zc<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zC", "zC<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zo", "zo<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zO", "zO<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "za", "za<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zA", "zA<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zr", "zr<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zR", "<cmd>lua require('ufo').openAllFolds()<cr><cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zM", "<cmd>lua require('ufo').closeAllFolds()<cr><cmd>IndentBlanklineRefresh<cr>", opts)

-- Nvim tree
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require('configs.telescope').project_files()<cr>", opts)
keymap("n", "<Tab>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)

-- Lspsaga
keymap("n", "[t", "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", opts)
keymap("n", "]t", "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", opts)

-- Lspsaga
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
keymap(
	"n",
	"[e",
	"<cmd>lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })<cr>",
	opts
)
keymap(
	"n",
	"]e",
	"<cmd>lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })<cr>",
	opts
)

-- Browser search
keymap("n", "gx", "<Plug>(openbrowser-smart-search)", opts)
keymap("x", "gx", "<Plug>(openbrowser-smart-search)", opts)
