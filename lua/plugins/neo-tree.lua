return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	keys = {
		{
			"<C-n>",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end,
			desc = "Toggle File Explorer",
		},
	},
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
		if vim.fn.argc() == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	opts = {
		enable_diagnostics = false,
		filesystem = {
			bind_to_cwd = false,
			follow_current_file = true,
		},
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
		},

		window = {
			mappings = {
				["s"] = "noop",
				["S"] = "noop",
				["<C-v>"] = "open_vsplit",
				["<C-x>"] = "open_split",
			},
		},
	},
}
