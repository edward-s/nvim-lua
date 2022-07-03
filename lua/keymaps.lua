local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "

keymap("i", "<C-c>", "<Esc>", opts)

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
keymap("n", "zc", "zc<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zo", "zo<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "za", "za<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zr", "zr<cmd>IndentBlanklineRefresh<cr>", opts)
keymap("n", "zR", "zR<cmd>IndentBlanklineRefresh<cr>", opts)

-- Nvim tree
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", opts)

-- Lazygit
keymap("n", "<C-g>", "<cmd>FloatermNew --height=0.9 --width=0.95 lazygit<cr>", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require('configs.telescope').project_files()<cr>", opts)

-- Bufferline
keymap("n", "<Tab>", "<cmd>BufferNext<cr>", opts)
keymap("n", "<S-Tab>", "<cmd>BufferPrevious<cr>", opts)

-- Test
keymap("n", "[t", "<Plug>(ultest-prev-fail)", opts)
keymap("n", "]t", "<Plug>(ultest-next-fail)", opts)

-- Lspsaga
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

-- Browser search
keymap("n", "gx", "<Plug>(openbrowser-smart-search)", opts)
keymap("x", "gx", "<Plug>(openbrowser-smart-search)", opts)

-- Emmet
vim.g.user_emmet_leader_key = "<C-e>"
