vim.g.mapleader = ' '

local opts = { noremap = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<Leader>q', '<cmd>q<CR>', opts)
-- keymap('n', '<Leader>w', '<cmd>w<CR>', opts)
keymap('n', '<Leader>x', '<cmd>bdelete<CR>', opts)

-- Split navigations
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Indentation
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Nvim tree
keymap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)
-- keymap('n', '<Leader>e', '<cmd>NvimTreeFocus<CR>', opts)
 
-- Telescope
keymap('n', '<C-p>', '<cmd>Telescope git_files<CR>', opts)
keymap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', opts)
keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', opts)
keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', opts)
keymap('n', '<Leader>vrc', '<cmd>lua require("configs.telescope").search_vimrc()<CR>', opts)

-- Bufferline
keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', opts)
keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', opts)
