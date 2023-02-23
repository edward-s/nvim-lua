local lib = require("diffview.lib")
local diffview = require("diffview")
local cb = require("diffview.config").diffview_callback

local M = {}

M.toggle = function()
	local view = lib.get_current_view()
	if view then
		vim.cmd(":DiffviewClose")
	else
		vim.cmd(":DiffviewOpen")
	end
end

M.toggle_file_history = function()
	local view = lib.get_current_view()
	if view == nil then
		vim.cmd(":DiffviewFileHistory %")
		return
	end

	if view then
		view:close()
		lib.dispose_view(view)
	end
end

diffview.setup({
	key_bindings = {
		view = {
			["q"] = "<cmd>DiffviewClose<cr>",
		},
		file_panel = {
			[" "] = cb("toggle_stage_entry"),
			["q"] = "<cmd>DiffviewClose<cr>",
		},
		file_history_panel = {
			["q"] = "<cmd>DiffviewClose<cr>",
		},
	},
})

return M
