require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  use 'gruvbox-community/gruvbox'

  -- Plugins
  use 'ggandor/lightspeed.nvim'
  use 'tpope/vim-surround'
  use "windwp/nvim-autopairs"
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'p00f/nvim-ts-rainbow'
  use "lukas-reineke/indent-blankline.nvim"

  -- Bufferline
  use 'akinsho/bufferline.nvim' 

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Telescope
  use "nvim-lua/popup.nvim" 
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"

  -- Unsure
  use 'nvim-lualine/lualine.nvim'
end)
