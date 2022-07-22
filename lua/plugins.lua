require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- Colorscheme
  use("sainnhe/gruvbox-material")

  -- Essentials
  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup()
    end
  })
  use("folke/which-key.nvim")
  use("ggandor/lightspeed.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("kyazdani42/nvim-web-devicons")
  use("lukas-reineke/indent-blankline.nvim")
  use("numToStr/Comment.nvim")
  use("nvim-lualine/lualine.nvim")
  use({
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  })
  use("romgrk/barbar.nvim")
  use("RRethy/vim-illuminate")
  use("akinsho/toggleterm.nvim")
  use("tpope/vim-unimpaired")
  use("antoinemadec/FixCursorHold.nvim")
  use {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      require("incline").setup()
    end,
  }
  use("wellle/targets.vim")
  use("edward-s/emmet-vim")
  use {
    "mrjones2014/legendary.nvim",
    requires = { "stevearc/dressing.nvim" },
  }
  use("tyru/open-browser.vim")
  use("lalitmee/browse.nvim")
  use {
    "kevinhwang91/nvim-ufo",
    requires = 'kevinhwang91/promise-async',
    config = function()
      require("ufo").setup()
    end,
  }
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  })
  use("ThePrimeagen/harpoon")

  -- Formatting
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end,
  })

  -- Test
  use({
    "nvim-neotest/neotest",
    requires = {
      "haydenmeade/neotest-jest",
    },
  })

  -- Debug
  use("mfussenegger/nvim-dap")
  use("Pocco81/DAPInstall.nvim")
  use("theHamsta/nvim-dap-virtual-text")
  use("rcarriga/nvim-dap-ui")

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
  use("williamboman/nvim-lsp-installer")
  use("jose-elias-alvarez/null-ls.nvim")
  use("onsails/lspkind-nvim")
  use("jose-elias-alvarez/nvim-lsp-ts-utils")
  use("glepnir/lspsaga.nvim")

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
