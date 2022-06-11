local telescope = require("telescope")
local actions = require "telescope.actions"

telescope.setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
  pickers = {
    buffers = {
      theme = 'dropdown',
      path_display = { 'smart' },
      previewer = false,
      mappings = {
        n = {
          ["<C-d>"] = actions.delete_buffer,
        },
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
      },
      sort_mru = true
    },
    find_files = {
      theme = 'dropdown',
      previewer = false,
      hidden = true,
      no_ignore = true
    },
    git_files = {
      theme = 'dropdown',
      previewer = false
    }
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
  local opts = {}
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then require "telescope.builtin".find_files(opts) end
end

return M
