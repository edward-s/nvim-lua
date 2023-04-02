local lib = require("diffview.lib")

local M = {}

M.toggle = function()
	local view = lib.get_current_view()
	if view then
		vim.cmd(":DiffviewClose")
		lib.dispose_view(view)
	else
		vim.cmd(":DiffviewOpen")
	end
end

M.toggle_file_history = function()
	local view = lib.get_current_view()
	if view then
		view:close()
		lib.dispose_view(view)
	else
		vim.cmd(":DiffviewFileHistory %")
	end
end

return M
