local present, indent_blankline = pcall(require, "indent_blankline")
if not present then
  return
end

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
  "dashboard",
  "NvimTree",
}

vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"

indent_blankline.setup({
  show_current_context = false,
})
