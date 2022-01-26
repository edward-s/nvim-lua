require("options")
require("keymaps")
require("plugins")
require("configs.bufferline")
require("configs.treesitter")
require("configs.autopairs")
require("configs.nvimtree")
require("configs.lualine")
require("configs.indentline")
require("configs.telescope")
require("configs.lsp")
require("configs.cmp")
require("configs.comment")
require("configs.toggleterm")
require("configs.gitsigns")
require("configs.zenmode")

-- onedark theme
require("onedark").setup({
	style = "dark",
})
require("onedark").load()
