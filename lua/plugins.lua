require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- Colorscheme
  use("sainnhe/gruvbox-material")

  -- Essentials
  use("folke/trouble.nvim")
  use("folke/which-key.nvim")
  use({
    "ggandor/leap.nvim",
    config = function()
      require("leap").set_default_keymaps()
    end,
  })
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
  use("akinsho/bufferline.nvim")
  use("RRethy/vim-illuminate")
  use("akinsho/toggleterm.nvim")
  use({ "tpope/vim-surround", event = "BufRead" })
  use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
  use("tpope/vim-unimpaired")
  use({ "kazhala/close-buffers.nvim", cmd = { "BDelete", "BWipeout" } })
  use({
    "antoinemadec/FixCursorHold.nvim",
    event = "BufReadPost",
  })
  use {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = function()
      require("incline").setup()
    end,
  }
  use { "wellle/targets.vim", event = "BufWinEnter" }

  -- Formatting
  use("p00f/nvim-ts-rainbow")
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end,
  })
  use("windwp/nvim-ts-autotag")

  -- Test
  use({ "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" })

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
  use {
    "tami5/lspsaga.nvim",
    config = function()
      require("lspsaga").setup()
    end,
  }

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

  -- Evaluating
  use("ThePrimeagen/harpoon")
  use {
    "chentoast/marks.nvim",
    event = "BufReadPre",
    config = function()
      require("marks").setup {}
    end,
  }
  use("edward-s/emmet-vim")
end)
