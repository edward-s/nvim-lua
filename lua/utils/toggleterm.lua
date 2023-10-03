local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	hidden = true,
	direction = "float",
	count = 100,
})

function M.lazygit_toggle()
	lazygit.dir = vim.fn.expand("%:p:h")
	lazygit:toggle()
end

local lazydocker = Terminal:new({
	cmd = "lazydocker",
	hidden = true,
	direction = "float",
	count = 100,
})

function M.lazydocker_toggle()
	lazydocker:toggle()
end

return M
