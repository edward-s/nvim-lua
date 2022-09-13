local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	hidden = true,
	direction = "float",
	close_on_exit = true,
})

function M.lazygit_toggle()
	lazygit:toggle()
end

function M.open_term(cmd, opts)
	opts = opts or {}
	opts.size = opts.size or vim.o.columns * 0.5
	opts.direction = opts.direction or "vertical"

	local new_term = Terminal:new({
		cmd = cmd,
		dir = "git_dir",
		auto_scroll = false,
		close_on_exit = true,
		start_in_insert = false,
	})
	new_term:open(opts.size, opts.direction)
end

function M.so()
	local buf = vim.api.nvim_get_current_buf()
	local file_type = vim.api.nvim_buf_get_option(buf, "filetype")
	vim.ui.input({ prompt = "so input: ", default = file_type .. " " }, function(input)
		local cmd = ""
		if input == "" or not input then
			return
		elseif input == "h" then
			cmd = "-h"
		else
			cmd = input
		end
		cmd = "so " .. cmd
		M.open_term(cmd, { direction = "float" })
	end)
end

return M
