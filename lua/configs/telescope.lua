local present, telescope = pcall(require, "telescope")

if not present then
	return
end

telescope.setup({
	file_sorter = require("telescope.sorters").get_fzy_sorter,
	color_devicons = true,
	set_env = { ["COLORTERM"] = "truecolor" },
	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
})

-- telescope.load_extension("harpoon")

local extensions = { "fzy_native" }

pcall(function()
	for _, ext in ipairs(extensions) do
		telescope.load_extension(ext)
	end
end)

local M = {}
M.search_vimrc = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim/",
	})
end

return M
