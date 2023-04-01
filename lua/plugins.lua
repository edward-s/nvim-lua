local packer = require("packer")

packer.init({
	max_jobs = 50,
})

packer.startup(function()
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use("sainnhe/gruvbox-material")

	-- Essentials
	use("zbirenbaum/copilot.lua")
	use("itchyny/vim-highlighturl")
	use("schickling/vim-bufonly")
	use("folke/which-key.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("lukas-reineke/indent-blankline.nvim")
	use("numToStr/Comment.nvim")
	use("nvim-lualine/lualine.nvim")
	use("tpope/vim-unimpaired")
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup()
		end,
	})
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})
	use("akinsho/bufferline.nvim")
	use("RRethy/vim-illuminate")
	use("akinsho/toggleterm.nvim")
	use("wellle/targets.vim")
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").set_default_keymaps()
		end,
	})
	use({
		"ggandor/flit.nvim",
		config = function()
			require("flit").setup()
		end,
	})
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup()
		end,
	})
	use("tpope/vim-surround")
	use({
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup()
		end,
	})
	use("ThePrimeagen/harpoon")
	use({
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
		end,
	})
	use("famiu/bufdelete.nvim")
	use({
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup()
		end,
	})
	use("j-hui/fidget.nvim")
	use("danymat/neogen")
	use({
		"declancm/cinnamon.nvim",
		config = function()
			require("cinnamon").setup()
		end,
	})

	-- Formatting
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- Test
	use({
		"nvim-neotest/neotest",
		requires = {
			"haydenmeade/neotest-jest",
		},
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
		},
	})

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("sindrets/diffview.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("HiPhish/nvim-ts-rainbow2")
	use("windwp/nvim-ts-autotag")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	})
	use("jose-elias-alvarez/null-ls.nvim")
	use("onsails/lspkind-nvim")
	use("glepnir/lspsaga.nvim")
	use("L3MON4D3/LuaSnip")

	-- Typescript
	use("jose-elias-alvarez/typescript.nvim")

	-- Cmp
	use("rafamadriz/friendly-snippets")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"zbirenbaum/copilot-cmp",
		},
	})
end)
