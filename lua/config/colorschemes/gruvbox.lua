vim.g.gruvbox_material_palette = "material"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_visual = "green background"

local grpid = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = grpid,
	pattern = "gruvbox-material",
  --stylua: ignore
  command = "hi NvimTreeNormal            guibg=bg1     |"
         .. "hi NvimTreeEndOfBuffer       guibg=bg1     |"
         .. "hi NvimTreeWinSeparator      guifg=#4f4943 |",
})

vim.cmd("colorscheme gruvbox-material")
