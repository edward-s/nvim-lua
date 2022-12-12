local packer = require("packer")

packer.init({
	max_jobs = 50,
})

packer.startup(function()
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use("sainnhe/gruvbox-material")

	-- Essentials
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	})
	use("zbirenbaum/copilot.lua")
	use("zbirenbaum/copilot-cmp")
	use("itchyny/vim-highlighturl")
	use("schickling/vim-bufonly")
	use("folke/which-key.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
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
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	})
	use({
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})
	use({
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})
	use("akinsho/bufferline.nvim")
	use("RRethy/vim-illuminate")
	use("akinsho/toggleterm.nvim")
	use({
		"b0o/incline.nvim",
		event = "BufReadPre",
		config = function()
			require("incline").setup()
		end,
	})
	use("wellle/targets.vim")
	use("stevearc/dressing.nvim")
	use("tyru/open-browser.vim")
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
	use("lalitmee/browse.nvim")
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
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	})
	use("ThePrimeagen/harpoon")
	use("CRAG666/code_runner.nvim")
	use({
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
		end,
	})
	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})
	use("famiu/bufdelete.nvim")

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
			"nvim-neotest/neotest-go",
		},
	})

	-- Debugging
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-telescope/telescope-dap.nvim",
			"mxsdev/nvim-dap-vscode-js",
		},
	})
	use({
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
	})

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("f-person/git-blame.nvim")
	use("sindrets/diffview.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-dap.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("onsails/lspkind-nvim")
	use("jose-elias-alvarez/typescript.nvim")
	use("glepnir/lspsaga.nvim")
	use("ray-x/lsp_signature.nvim")

	-- Cmp
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "f3fora/cmp-spell" },
		},
	})

	-- Snippets
	use({
		"hrsh7th/cmp-vsnip",
		requires = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"rafamadriz/friendly-snippets",
		},
	})
end)
