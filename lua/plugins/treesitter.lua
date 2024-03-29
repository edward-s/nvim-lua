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
		},
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treeitter** module to be loaded in time.
			-- Luckily, the only thins that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
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
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}
