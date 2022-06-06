local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

bufferline.setup({
  options = {
    diagnostics = false,
    enforce_regular_tabs = false,
    offsets = { { filetype = "NvimTree", text = "" } },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "thin",
  },
})
