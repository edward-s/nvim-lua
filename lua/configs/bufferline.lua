local present, bufferline = pcall(require, "bufferline")
if not present then
  return
end

bufferline.setup({
  options = {
    numbers = "none",
    diagnostics = false,
    enforce_regular_tabs = false,
    persist_buffer_sort = true,
    offsets = { { filetype = "NvimTree", text = "" } },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = "thin",
    always_show_bufferline = true,
  },
})
