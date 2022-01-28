vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Leader>q", "<cmd>q<CR>", opts)
keymap("n", "<Leader>x", "<cmd>bd<CR>", opts)
keymap("n", "<Leader>X", "<cmd>%bd|e#|bd#<CR>", opts)
keymap("n", "<C-c>", "<cmd>nohl<CR>", opts)

-- Split navigations
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Formatting
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- Nvim tree
keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)

-- ZenMode
keymap("n", "<Leader>z", "<cmd>ZenMode<CR>", opts)

-- Terminal
keymap("n", "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap("n", "<Leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", opts)

-- Telescope
keymap(
	"n",
	"<C-p>",
	"<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown{ previewer = false })<CR>",
	opts
)
keymap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", opts)
keymap("n", "<Leader>vrc", '<cmd>lua require("configs.telescope").search_vimrc()<CR>', opts)

-- Bufferline
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
