local Utils = require("utils")

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = "Telescope",
		keys = {
			{ "<C-p>", Utils.telescope("files", { cwd = false }), desc = "Find files (root dir)" },
			{ "<leader>,", "<cmd>Telescope buffers<cr>", desc = "Show Buffers" },
			{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
			{ "<leader>sf", Utils.telescope("files"), desc = "Find Files (root dir)" },
			{ "<leader>sF", Utils.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
			{ "<leader>sg", Utils.telescope("live_grep"), desc = "Grep (root dir)" },
			{ "<leader>sG", Utils.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Man Pages" },
			{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
			{ "<leader>so", Utils.telescope("oldfiles"), desc = "Old Files (cwd)" },
			{ "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume" },
			{ "<leader>sw", Utils.telescope("grep_string"), desc = "Word (root dir)" },
			{ "<leader>sW", Utils.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
		},
		config = function(_, _)
			local telescope = require("telescope")

			local opts = {
				pickers = {
					buffers = {
						theme = "dropdown",
						path_display = { "smart" },
						previewer = false,
						mappings = {
							n = {
								["<C-d>"] = "delete_buffer",
							},
							i = {
								["<C-d>"] = "delete_buffer",
							},
						},
						sort_mru = true,
					},
					find_files = {
						theme = "dropdown",
						previewer = false,
						hidden = true,
						no_ignore = true,
					},
					git_files = {
						theme = "dropdown",
						previewer = false,
					},
				},
				defaults = {
					mappings = {
						n = {
							["q"] = function(...)
								return require("telescope.actions").close(...)
							end,
						},
					},
				},
			}
			telescope.setup(opts)
			telescope.load_extension("fzf")
		end,
	},
}
