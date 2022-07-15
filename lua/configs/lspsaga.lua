local saga = require 'lspsaga'

saga.init_lsp_saga({
  border_style = "rounded",
  code_action_keys = {
    quit = "<Esc>",
  },
  rename_action_quit = "<Esc>",
})
