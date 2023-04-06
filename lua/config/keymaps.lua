local keymap = vim.keymap.set

-- Split navigations
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize windows
keymap("n", "<A-j>", ":resize -2<cr>")
keymap("n", "<A-k>", ":resize +2<cr>")
keymap("n", "<A-h>", ":vertical resize -2<cr>")
keymap("n", "<A-l>", ":vertical resize +2<cr>")

-- Better indent
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Code folding
keymap("n", ",", "za")

-- Browser
keymap("n", "gx", "<Plug>(openbrowser-smart-search)")
keymap("x", "gx", "<Plug>(openbrowser-smart-search)")

-- Search word under cursor
keymap("n", "gw", "*N")
keymap("x", "gw", "*N")

-- Tabs
keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
keymap("n", "<leader><tab>d", "<cmd>tabclose<cr>")
