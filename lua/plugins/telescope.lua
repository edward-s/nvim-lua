local function find_files()
	local opts = {}
	local telescope = require("telescope.builtin")

	local ok = pcall(telescope.git_files, opts)
	if not ok then
		telescope.find_files(opts)
	end
end

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = "Telescope",
		keys = {
			{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Man Pages" },
			{ "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
			{ "<C-p>", find_files, desc = "Find files" },
		},
		config = function(_, _)
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			local opts = {
				pickers = {
					buffers = {
						theme = "dropdown",
						path_display = { "smart" },
						previewer = false,
						mappings = {
							n = {
								["<C-d>"] = actions.delete_buffer,
							},
							i = {
								["<C-d>"] = actions.delete_buffer,
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
			}
			telescope.setup(opts)
			telescope.load_extension("fzf")
		end,
	},
}
