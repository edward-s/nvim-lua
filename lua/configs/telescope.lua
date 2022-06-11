local telescope = require("telescope")

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

local M = {}

M.project_files = function()
  local opts = require('telescope.themes').get_dropdown { previewer = false }
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then require "telescope.builtin".find_files(opts) end
end

return M
