require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- Colorscheme
	-- use("navarasu/onedark.nvim")
	use("sainnhe/gruvbox-material")
	-- use("eddyekofo94/gruvbox-flat.nvim")

	-- Plugins
	use("ThePrimeagen/harpoon")
	use("akinsho/toggleterm.nvim")
	use("f-person/git-blame.nvim")
	use("famiu/bufdelete.nvim")
	use("folke/todo-comments.nvim")
	use("folke/trouble.nvim")
	use("folke/which-key.nvim")
	use("ggandor/lightspeed.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("lukas-reineke/indent-blankline.nvim")
	use("mattn/emmet-vim")
	use("mhinz/vim-startify")
	use("norcalli/nvim-colorizer.lua")
	use("numToStr/Comment.nvim")
	use("nvim-lualine/lualine.nvim")
	use("p00f/nvim-ts-rainbow")
	use("RRethy/vim-illuminate")
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Test
	use({ "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" })

	-- Bufferline
	use("akinsho/bufferline.nvim")

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Telescope
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("onsails/lspkind-nvim")

	-- Cmp
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
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
