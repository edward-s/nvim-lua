local lib = require("diffview.lib")

local M = {}

M.toggle = function()
  local view = lib.get_current_view()
  if view == nil then
    vim.cmd(':DiffviewFileHistory %');
    return
  end

  if view then
    view:close()
    lib.dispose_view(view)
  end
end

return M
