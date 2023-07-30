local Utils = require("utils")
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
for _, key in pairs({
	"zA",
	"zC",
	"zM",
	"zO",
	"zR",
	"zX",
	"za",
	"zc",
	"zm",
	"zo",
	"zr",
	"zv",
	"zx",
}) do
	keymap("n", key, key .. "<cmd>IndentBlanklineRefresh<cr>")
end
keymap("n", ",", "za<cmd>IndentBlanklineRefresh<cr>")

-- Search word under cursor
keymap("n", "gw", "*N")
keymap("x", "gw", "*N")

-- No highlight
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>")

-- Save/quit
keymap("n", "<leader>q", "<cmd>lua require('utils').quit()<cr>")
keymap("n", "<leader>w", "<cmd>w<cr>")

-- Tabs
keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
keymap("n", "<leader><tab>q", "<cmd>tabclose<cr>", { desc = "Close tab" })

-- Buffers
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>br", "<cmd>NvimTreeClose<cr><C-w>r", { desc = "Swap" })
keymap("n", "<leader>bh", "<cmd>hsplit<cr>", { desc = "Horizontal Split" })
keymap("n", "<leader>bv", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
keymap("n", "<leader>b=", "<C-w>=", { desc = "Equally Size" })
keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Quickfix
keymap("n", "<leader>xq", "<cmd>bot copen<cr>", { desc = "Quickfix List" })
keymap("n", "[q", "<cmd>silent! cprev<cr>", { desc = "Previous quickfix" })
keymap("n", "]q", "<cmd>silent! cnext<cr>", { desc = "Next quickfix" })

-- Bufferline
keymap("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
keymap("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

-- Toggle options
keymap("n", "<leader>uf", require("plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
-- stylua: ignore
keymap("n", "<leader>ul", function() Utils.toggle_line_numbers() end, { desc = "Toggle Line Numbers" })
keymap("n", "<leader>ud", Utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })
