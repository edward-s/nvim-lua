require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- Colorscheme
  use("sainnhe/gruvbox-material")

  -- Plugins
  use("RRethy/vim-illuminate")
  use("ThePrimeagen/harpoon")
  use("akinsho/toggleterm.nvim")
  use("f-person/git-blame.nvim")
  use({
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup({})
    end,
  })
  use("folke/trouble.nvim")
  use("folke/which-key.nvim")
  use("ggandor/lightspeed.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("kyazdani42/nvim-web-devicons")
  use("lukas-reineke/indent-blankline.nvim")
  use("numToStr/Comment.nvim")
  use("nvim-lualine/lualine.nvim")
  use("p00f/nvim-ts-rainbow")
  use({ "tpope/vim-surround", event = "BufRead" })
  use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })
  use("tpope/vim-unimpaired")
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end,
  })
  use("windwp/nvim-ts-autotag")
  use({ "kazhala/close-buffers.nvim", cmd = { "BDelete", "BWipeout" } })
  use("b0o/schemastore.nvim")
  use({
    "antoinemadec/FixCursorHold.nvim",
    event = "BufReadPost",
  })
  use { "ray-x/lsp_signature.nvim" }

  -- Test
  use({ "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" })

  -- Debugging
  use("mfussenegger/nvim-dap")
  use("Pocco81/DAPInstall.nvim")
  use("theHamsta/nvim-dap-virtual-text")
  use("rcarriga/nvim-dap-ui")

  -- Bufferline
  use("akinsho/bufferline.nvim")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use({
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
    },
  })

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
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
