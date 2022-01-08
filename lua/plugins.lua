require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'sainnhe/gruvbox-material'
  -- use 'joshdick/onedark.vim'

  -- Plugins
  use 'ggandor/lightspeed.nvim'
  use 'tpope/vim-surround'
  use "windwp/nvim-autopairs"
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'p00f/nvim-ts-rainbow'
  use "lukas-reineke/indent-blankline.nvim"
  use "terrortylor/nvim-comment"
  use "akinsho/toggleterm.nvim"

  -- Bufferline
  use 'akinsho/bufferline.nvim' 

  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Telescope
  use "nvim-lua/popup.nvim" 
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"

  -- LSP
  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Unsure
  use 'nvim-lualine/lualine.nvim'
end)
