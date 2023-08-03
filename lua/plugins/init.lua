return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
	},
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {
			keymaps = {
				visual = "z",
			},
		},
	},
	{ "wellle/targets.vim", event = "VeryLazy" },
	{ "itchyny/vim-highlighturl", event = { "BufReadPost", "BufNewFile" } },
	{ "felipec/vim-sanegx", event = "BufRead" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "stevearc/dressing.nvim", event = { "VeryLazy" } },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local opts = {
				ignore = "^$",
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
			require("Comment").setup(opts)
		end,
	},
	{
    --stylua: ignore
		keys = { { "<leader>ba", "<cmd>silent BufOnly<cr>", desc = "Close Other Buffers" } },
		"schickling/vim-bufonly",
	},
	{
		"monaqa/dial.nvim",
		keys = { "<C-a>", "<C-x>", { "<C-a>", "v" }, { "<C-x>", "v" }, { "g<C-a>", "v" }, { "g<C-x>", "v" } },
     -- stylua: ignore
     init = function()
       vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { desc = "Increment", noremap = true })
       vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { desc = "Decrement", noremap = true })
       vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { desc = "Increment", noremap = true })
       vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { desc = "Decrement", noremap = true })
       vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { desc = "Increment", noremap = true })
       vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { desc = "Decrement", noremap = true })
     end,
	},
	{
		"chentoast/marks.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
    -- stylua: ignore
		keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
		},
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
	},
	{
		"windwp/nvim-spectre",
      -- stylua: ignore
      keys = {
        { "<leader>sR", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
      },
	},
}
