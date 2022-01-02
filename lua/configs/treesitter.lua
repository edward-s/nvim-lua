local present, ts_configs = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

ts_configs.setup {
  ensure_installed = {
    "html", "lua", "javascript", "typescript", "css"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true
  }
}
