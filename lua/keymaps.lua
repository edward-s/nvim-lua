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

-- Resize windows
keymap("n", "<A-j>", ":resize -2<CR>", opts)
keymap("n", "<A-k>", ":resize +2<CR>", opts)
keymap("n", "<A-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-l>", ":vertical resize +2<CR>", opts)

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Fugitive
keymap("n", "<leader>df", ":diffget //2<CR>", opts)
keymap("n", "<leader>dj", ":diffget //3<CR>", opts)

-- Vim-test
keymap("n", "<leader>t", ":TestNearest<CR>", opts)
keymap("n", "<leader>T", ":TestFile<CR>", opts)
keymap("n", "<leader>a", ":TestSuite<CR>", opts)

-- Formatting
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)

-- Git signs
keymap("n", "<leader>gb", "<cmd>lua require 'gitsigns'.blame_line()<CR>", opts)
keymap("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<CR>", opts)
keymap("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", opts)
keymap("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", opts)
keymap("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", opts)
keymap("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", opts)

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
keymap("n", "<Leader>fr", "<cmd>Telescope resume<CR>", opts)
keymap("n", "<Leader>vrc", '<cmd>lua require("configs.telescope").search_vimrc()<CR>', opts)

-- TsUtils
keymap("n", "<Leader>gi", "<cmd>TSLspImportAll<CR>", opts)

-- Harpoon
keymap("n", "<C-m>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<Leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<Leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<Leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<Leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)

-- Bufferline
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", opts)
