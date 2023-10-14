local swap_next, swap_prev = (function()
	local swap_objects = {
		c = "@class.outer",
		f = "@function.outer",
		p = "@parameter.inner",
	}

	local n, p = {}, {}
	for key, obj in pairs(swap_objects) do
		n[string.format("<leader>cs%s", key)] = obj
		p[string.format("<leader>cS%s", key)] = obj
	end

	return n, p
end)()

return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		cmd = { "TSUpdateSync" },
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		opts = {
			ensure_installed = {
				"bash",
				"graphql",
				"html",
				"javascript",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"vim",
				"yaml",
				"jsdoc",
			},
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			context_commentstring = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["ia"] = "@assignment.inner",
						["aa"] = "@assignment.outer",
						["ac"] = "@comment.outer",
						["ii"] = "@conditional.inner",
						["ai"] = "@conditional.outer",
						["if"] = "@function.inner",
						["af"] = "@function.outer",
					},
				},
				swap = {
					enable = true,
					swap_next = swap_next,
					swap_previous = swap_prev,
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]m"] = "@function.outer",
						["]]"] = "@class.outer",
					},
					goto_next_end = {
						["]M"] = "@function.outer",
						["]["] = "@class.outer",
					},
					goto_previous_start = {
						["[m"] = "@function.outer",
						["[["] = "@class.outer",
					},
					goto_previous_end = {
						["[M"] = "@function.outer",
						["[]"] = "@class.outer",
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			local wk = require("which-key")
			wk.register({
				["<leader>cs"] = {
					name = "+Swap Next",
					c = { "@class.outer", "Class" },
					f = { "@function.outer", "Function" },
					p = { "@parameter.inner", "Parameter" },
				},
				["<leader>cS"] = {
					name = "+Swap Previous",
					c = { "@class.outer", "Class" },
					f = { "@function.outer", "Function" },
					p = { "@parameter.inner", "Parameter" },
				},
			})

			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

			-- Repeat movement with ; and ,
			-- ensure ; goes forward and , goes backward regardless of the last direction
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
		end,
	},
}
