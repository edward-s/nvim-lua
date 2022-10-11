local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

nvimtree.setup({
	disable_netrw = true,
	open_on_setup = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
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
		mappings = {
			list = {
				{ key = "<C-t>", cb = "<cmd>ToggleTerm<cr>" },
				{ key = "s", cb = "<cmd>HopChar2AC<cr>" },
				{ key = "S", cb = "<cmd>HopChar2BC<cr>" },
			},
		},
	},
	remove_keymaps = { "H", "M", "L" },
})
