local present, which_key = pcall(require, "which-key")
if not present then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
}

which_key.register(mappings, opts)