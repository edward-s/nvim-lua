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

local lazynpm = Terminal:new({
	cmd = "lazynpm",
	hidden = true,
	direction = "float",
	count = 100,
})

function M.lazynpm_toggle()
	lazynpm:toggle()
end

return M
