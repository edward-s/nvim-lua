vim.g.gruvbox_material_palette = "material"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_visual = "green background"

vim.cmd([[ 
function! s:gruvbox_material_custom() abort
  hi! link FloatBorder Normal
  hi! link DiagnosticWarn None
  hi! link DiagnosticError None
  hi! link DiagnosticInfo None
  hi! link DiagnosticHint None
  hi! link DefinitionSearch None
endfunction

augroup GruvboxMaterialCustom
  autocmd!
  autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
augroup END

colorscheme gruvbox-material
]])
