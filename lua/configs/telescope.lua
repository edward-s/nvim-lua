local present, telescope = pcall(require, "telescope")

if not present then
	return
end

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
	file_sorter = require("telescope.sorters").get_fzy_sorter,
	color_devicons = true,
	set_env = { ["COLORTERM"] = "truecolor" },
	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
})

local extensions = { "fzf", "project" }

pcall(function()
	for _, ext in ipairs(extensions) do
		telescope.load_extension(ext)
	end
end)
