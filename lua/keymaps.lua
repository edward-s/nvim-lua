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

-- Telescope
keymap(
  "n",
  "<C-p>",
  "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown{ previewer = false })<cr>",
  opts
)

-- Bufferline
keymap("n", "<Tab>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-Tab>", "<cmd>bprevious<cr>", opts)

-- Lspsaga
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
