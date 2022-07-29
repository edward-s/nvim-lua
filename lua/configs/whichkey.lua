local present, which_key = pcall(require, "which-key")

if not present then
  return
end

which_key.setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
})

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["h"] = { "<cmd>nohlsearch<cr>", "No Highlight" },
  ["q"] = { "<cmd>q<cr>", "Quit" },
  b = {
    name = "Buffers",
    a = { "<cmd>BufferCloseAllButCurrent<cr>", "Close other buffers" },
    d = { "<cmd>BufferClose<cr>", "Close buffer" },
    p = { "<cmd>BufferPin<cr>", "Pin buffer" },
  },
  c = {
    name = "Quickfix",
    o = { "<Cmd>copen<cr>", "Open quickfix" },
    c = { "<Cmd>cclose<cr>", "Close quickfix" },
    n = { "<Cmd>cnext<cr>", "Next quickfix" },
    p = { "<Cmd>cprev<cr>", "Previous quickfix" },
  },
  d = {
    name = "Debug",
    b = { "<Cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },
    c = { "<Cmd>lua require('dap').continue()<cr>", "Continue" },
    d = { "<Cmd>lua require('dap').run_to_cursor()<cr>", "Run to cursor" },
    s = { "<Cmd>lua require('dap').step_over()<cr>", "Step over" },
    i = { "<Cmd>lua require('dap').step_into()<cr>", "Step into" },
    o = { "<Cmd>lua require('dap').step_out()<cr>", "Step out" },
    u = { "<Cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
    p = { "<Cmd>lua require('dap').repl.open()<cr>", "REPL" },
    X = { "<Cmd>lua require('dap').clear_breakpoints()<cr>", "Clear breakpoints" },
    e = { '<Cmd>lua require"telescope".extensions.dap.commands{}<cr>', "Commands" },
    f = { '<Cmd>lua require"telescope".extensions.dap.configurations{}<cr>', "Configurations" },
    r = { '<Cmd>lua require"telescope".extensions.dap.list_breakpoints{}<cr>', "List breakpoints" },
    v = { '<Cmd>lua require"telescope".extensions.dap.variables{}<cr>', "Variables" },
    m = { '<Cmd>lua require"telescope".extensions.dap.frames{}<cr>', "Frames" },
  },
  g = {
    name = "Git",
    b = { "<cmd>GitBlameToggle<cr>", "Toggle blame" },
    B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
    d = { '<cmd>lua require("configs.diffview").toggle()<cr>', 'Diff file' },
    g = { '<cmd>lua _lazygit_toggle()<cr>', 'LazyGit' },
  },
  j = {
    name = "Jump",
    a = { "<Cmd>lua require('harpoon.mark').add_file()<Cr>", "Add File" },
    m = { "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<Cr>", "UI Menu" },
    c = { "<Cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<Cr>", "Command Menu" },
  },
  ["1"] = { "<Cmd>lua require('harpoon.ui').nav_file(1) <Cr>", "File 1" },
  ["2"] = { "<Cmd>lua require('harpoon.ui').nav_file(2) <Cr>", "File 2" },
  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
    e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
    f = { "<cmd>Lspsaga lsp_finder<cr>", "Lsp Finder" },
    k = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
    K = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
    l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line diagnostics" },
    q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
    R = { "<cmd>Lspsaga rename<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    t = { "<cmd>TroubleToggle<cr>", "Trouble" },
    w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
  },
  m = {
    name = "Misc",
    l = { "<cmd>Legendary<cr>", "Legendary" },
  },
  p = {
    name = "Project",
    p = { "<cmd>Telescope project<cr>", "List projects" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    f = { "<cmd>Telescope find_files<cr>", "Find" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Man Pages" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    p = { "<cmd>lua require('browse').input_search()<cr>", "Google" },
    r = { "<cmd>Telescope resume<cr>", "Resume Search" },
    s = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
    w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
  },
  t = {
    name = "Test",
    a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
    d = { "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>", "Directory" },
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
    l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
    o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
    s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
    S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
    t = { "<cmd>lua require('neotest').run.run()<cr>", "Nearest" },
  },
  w = {
    name = "Window",
    o = { "<c-w>o", "Close others" },
    q = { "<cmd>:q<cr>", "Close" },
    t = { "<c-w>t", "Move to new tab" },
    ["="] = { "<c-w>=", "Equally size" },
    v = { "<cmd>:vsplit<cr>", "Vertical Split" },
    r = { "<c-w>r", "Swap" },
    x = { "<cmd>:split<cr>", "Horizontal Split" },
  },
}

which_key.register(mappings, opts)
