local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	pickers = {
		buffers = {
			theme = "dropdown",
			path_display = { "smart" },
			previewer = false,
			mappings = {
				n = {
					["<C-d>"] = actions.delete_buffer,
				},
				i = {
					["<C-d>"] = actions.delete_buffer,
				},
			},
			sort_mru = true,
		},
		find_files = {
			theme = "dropdown",
			previewer = false,
			hidden = true,
			no_ignore = true,
		},
		git_files = {
			theme = "dropdown",
			previewer = false,
		},
	},
})

local extensions = { "fzf" }

pcall(function()
	for _, ext in ipairs(extensions) do
		telescope.load_extension(ext)
	end
end)

local M = {}

M.project_files = function()
	local opts = {}
	vim.fn.system("git rev-parse --is-inside-work-tree")
	if vim.v.shell_error == 0 then
		require("telescope.builtin").git_files(opts)
	else
		require("telescope.builtin").find_files(opts)
	end
end

return M
