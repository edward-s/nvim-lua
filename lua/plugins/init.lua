return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
	},
	"nvim-lua/plenary.nvim",
	"MunifTanjim/nui.nvim",
	{
		"nvim-tree/nvim-web-devicons",
		dependencies = { "DaikyXendo/nvim-material-icon" },
		config = function()
			require("nvim-web-devicons").setup({
				override = require("nvim-material-icon").get_icons(),
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{ "tpope/vim-unimpaired", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "wellle/targets.vim", event = "VeryLazy" },
	{ "itchyny/vim-highlighturl", event = { "BufReadPost", "BufNewFile" } },
	{ "tyru/open-browser.vim", event = { "BufReadPost", "BufNewFile" } },
	{
		"numToStr/Comment.nvim",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		event = { "BufReadPost", "BufNewFile" },
		config = function(_, _)
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
    --stylua: ignore
		keys = { { "<leader>bd", "<cmd>Bdelete<cr>", desc = "Delete Buffer" } },
		"famiu/bufdelete.nvim",
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
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		opts = { delay = 200 },
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
	},
	{
		"chentoast/marks.nvim",
		event = { "BufReadPost", "BufNewFile" },
		keys = { { "<leader>mm", "<cmd>MarksListAll<cr>", desc = "Show Marks" } },
		config = function()
			require("marks").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("hlslens").setup()
		end,
	},
}
