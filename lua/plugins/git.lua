return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Current Line Blame" },
		},
		opts = {
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")
				map("n", "<leader>gb", function()
					gs.blame_line({ full = true })
				end, "Blame Line")
			end,
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"sindrets/diffview.nvim",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<leader>gd", "<cmd>lua require('utils.diffview').toggle()<cr>", desc = "Git Diff" },
			{ "<leader>gh", "<cmd>lua require('utils.diffview').toggle_file_history()<cr>", desc = "Git History" },
		},
		opts = {
			key_bindings = {
				view = {
					["q"] = "<cmd>DiffviewClose<cr>",
				},
				file_panel = {
					["q"] = "<cmd>DiffviewClose<cr>",
				},
				file_history_panel = {
					["q"] = "<cmd>DiffviewClose<cr>",
				},
			},
		},
		config = function(_, opts)
			require("diffview").setup(opts)
		end,
	},
}
