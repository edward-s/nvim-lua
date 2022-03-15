require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use("navarasu/onedark.nvim")

	-- Plugins
	use("ThePrimeagen/harpoon")
	use("akinsho/toggleterm.nvim")
	use("f-person/git-blame.nvim")
	use("folke/trouble.nvim")
	use("folke/which-key.nvim")
	use("folke/zen-mode.nvim")
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
	use("tpope/vim-surround")
	use("tpope/vim-unimpaired")
	use("vim-test/vim-test")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

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

	-- Cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
end)
