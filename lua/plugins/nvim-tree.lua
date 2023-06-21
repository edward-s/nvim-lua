return {
	"nvim-tree/nvim-tree.lua",
  --stylua: ignore
	keys = {
		{
			"<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer",
		},
	},
	cmd = "NvimTreeToggle",
	opts = {
		hijack_cursor = true,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
		},
		view = {
			width = 40,
		},
		filters = {
			dotfiles = false,
			custom = { ".git" },
		},
		renderer = {
			indent_markers = {
				enable = true,
			},
			root_folder_label = false,
			icons = {
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
		on_attach = require("utils.nvim-tree").on_attach,
	},
}
