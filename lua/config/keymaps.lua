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

-- Search word under cursor
keymap("n", "gw", "*N")
keymap("x", "gw", "*N")

-- Tabs
keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
keymap("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })

-- Buffers
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Quickfix
keymap("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
