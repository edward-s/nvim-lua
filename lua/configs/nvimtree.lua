local g = vim.g

g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 1 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}
g.nvim_tree_icons = {
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
}

local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

nvimtree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = false,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
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
	view = {
		width = 35,
		height = 35,
		hide_root_folder = true,
		side = "left",
		auto_resize = true,
		mappings = {
			list = {},
		},
		signcolumn = "yes",
	},
})
