local g = vim.g

g["test#strategy"] = "neovim"
g["test#neovim#term_position"] = "bel 15"
g["test#preserve_screen"] = 1
g["ultest_use_pty"] = 1
g["ultest_summary_height"] = 10
g["ultest_output_on_run"] = 0
g["ultest_summary_open"] = "botright split | resize 10"
