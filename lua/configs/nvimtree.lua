local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

nvimtree.setup({
	disable_netrw = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
	},
	filters = {
		dotfiles = false,
		custom = { ".git" },
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		highlight_git = true,
		icons = {
			show = {
				folder = true,
				file = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
	view = {
		width = 40,
		hide_root_folder = true,
	},
	remove_keymaps = { "H", "M", "L", "<C-t>", "s", "S" },
})

local function open_nvim_tree(data)
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	local directory = vim.fn.isdirectory(data.file) == 1
	if not no_name and not directory then
		return
	end

	if directory then
		vim.cmd.cd(data.file)
	end

	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
