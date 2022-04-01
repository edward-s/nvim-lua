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
		width = 40,
		hide_root_folder = true,
		side = "left",
		auto_resize = true,
		signcolumn = "yes",
		mappings = {
			list = {
				{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
				{ key = "<C-e>", action = "edit_in_place" },
				{ key = { "O" }, action = "edit_no_picker" },
				{ key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
				{ key = "<C-v>", action = "vsplit" },
				{ key = "<C-x>", action = "split" },
				{ key = "<C-t>", action = "tabnew" },
				{ key = "<", action = "prev_sibling" },
				{ key = ">", action = "next_sibling" },
				{ key = "P", action = "parent_node" },
				{ key = "<BS>", action = "close_node" },
				{ key = "<Tab>", action = "preview" },
				{ key = "K", action = "first_sibling" },
				{ key = "J", action = "last_sibling" },
				{ key = "I", action = "toggle_git_ignored" },
				{ key = "H", cb = "H" },
				{ key = "R", action = "refresh" },
				{ key = "a", action = "create" },
				{ key = "d", action = "remove" },
				{ key = "D", action = "trash" },
				{ key = "G", action = "toggle_dot_files" },
				{ key = "r", action = "rename" },
				{ key = "<C-r>", action = "full_rename" },
				{ key = "x", action = "cut" },
				{ key = "c", action = "copy" },
				{ key = "p", action = "paste" },
				{ key = "y", action = "copy_name" },
				{ key = "Y", action = "copy_path" },
				{ key = "gy", action = "copy_absolute_path" },
				{ key = "[c", action = "prev_git_item" },
				{ key = "]c", action = "next_git_item" },
				{ key = "-", action = "dir_up" },
				{ key = "s", cb = "<Plug>Lightspeed_s" },
				{ key = "S", cb = "<Plug>Lightspeed_S" },
				{ key = "q", action = "close" },
				{ key = "g?", action = "toggle_help" },
				{ key = "W", action = "collapse_all" },
				{ key = "<C-k>", action = "toggle_file_info" },
				{ key = ".", action = "run_file_command" },
			},
		},
	},
})
