vim.cmd([[ 

function! s:gruvbox_material_custom() abort
  highlight! link DiagnosticWarn None
  highlight! link DiagnosticError None
  highlight! link DiagnosticInfo None
  highlight! link DiagnosticHint None
endfunction

augroup GruvboxMaterialCustom
  autocmd!
  autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
augroup END

colorscheme gruvbox-material

]])