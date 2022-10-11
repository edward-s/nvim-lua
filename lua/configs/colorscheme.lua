vim.cmd([[ 
    highlight! link DiagnosticWarn None
    highlight! link DiagnosticError None
    highlight! link DiagnosticInfo None
    highlight! link DiagnosticHint None
  endfunction

  augroup GruvboxMaterialCustom
    autocmd!
    autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
  augroup END

  let g:gruvbox_material_visual = 'green background'

  colorscheme gruvbox-material
]])
