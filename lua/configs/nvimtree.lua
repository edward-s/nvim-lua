local present, nvimtree = pcall(require, "nvim-tree")

if not present then
	return
end

local g = vim.g

g.nvim_tree_quit_on_open = 0
g.nvim_tree_indent_markers = 1

nvimtree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	auto_close = false,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = false,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	filters = {
		dotfiles = false,
		custom = { ".git" },
	},
	git = {
		ignore = false,
	},
	view = {
		width = 25,
		hide_root_folder = true,
		side = "left",
		auto_resize = true,
		mappings = {
			list = {
				{ key = "X", cb = ":lua require'nvim-tree.lib'.collapse_all()<CR>" },
			},
		},
	},
})
