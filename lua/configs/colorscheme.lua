vim.cmd([[ 
function! s:gruvbox_material_custom() abort
  highlight! link DiagnosticWarn None
  highlight! link DiagnosticError None
  highlight! link DiagnosticInfo None
  highlight! link DiagnosticHint None
  highlight! link DefinitionSearch None
  highlight! link ActionPreviewNormal None
  highlight! link CodeActionNormal None
  highlight! link FinderNormal None
  highlight! link HoverNormal None
  highlight! link RenameNormal None
endfunction

augroup GruvboxMaterialCustom
  autocmd!
  autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
augroup END

let g:gruvbox_material_visual = 'green background'

colorscheme gruvbox-material
]])
