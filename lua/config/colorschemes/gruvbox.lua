vim.g.gruvbox_material_palette = "material"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_visual = "green background"

local grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = grpid,
	pattern = "gruvbox-material",
  --stylua: ignore
  command = "hi NvimTreeNormal            guibg=#282828 |"
         .. "hi NvimTreeEndOfBuffer       guibg=#282828 |"
         .. "hi FloatBorder               None |",
})

vim.cmd("colorscheme gruvbox-material")
