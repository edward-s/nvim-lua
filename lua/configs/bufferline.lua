local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

bufferline.setup({
  options = {
    numbers = "none",
    diagnostics = false,
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = "thin",
  },
})
