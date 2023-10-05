return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<cr>", "Stage Hunk")
        map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<cr>", "Reset Hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<leader>gd", "<cmd>lua require('utils.diffview').toggle_file_history()<cr>", desc = "Diffview (File)" },
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
	{
		"ThePrimeagen/git-worktree.nvim",
		config = function(_, opts)
			local git_worktree = require("git-worktree")
			git_worktree.setup(opts)
			require("telescope").load_extension("git_worktree")

			git_worktree.on_tree_change(function(op)
				if op == git_worktree.Operations.Switch then
					-- close all open terminals
					vim.api.nvim_command("TermExec cmd='' open=0")
					vim.api.nvim_command("TermExec cmd='exit' open=0")
				end
			end)
		end,
    --stylua: ignore
    keys = {
      { "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "Worktree" },
    },
	},
}
