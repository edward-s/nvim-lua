vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Split navigations
keymap('n', '<A-h>', '<C-w>h', opts);
keymap('n', '<A-j>', '<C-w>j', opts);
keymap('n', '<A-k>', '<C-w>k', opts);
keymap('n', '<A-l>', '<C-w>l', opts);

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
