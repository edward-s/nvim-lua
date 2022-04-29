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
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
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
		a = {
			"<cmd>BWipeout other<cr>",
			"Close other buffers",
		},
		d = { "<cmd>BDelete this<CR>", "Close Buffer" },
	},
	c = {
		name = "Quickfix",
		o = { "<Cmd>copen<Cr>", "Open quickfix" },
		x = { "<Cmd>cclose<Cr>", "Close quickfix" },
		n = { "<Cmd>cnext<Cr>", "Next quickfix" },
		p = { "<Cmd>cprev<Cr>", "Previous quickfix" },
	},
	d = {
		name = "Debug",
		b = { "<Cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint" },
		c = { "<Cmd>lua require('dap').continue()<CR>", "Continue" },
		d = { "<Cmd>lua require('dap').run_to_cursor()<CR>", "Run to cursor" },
		s = { "<Cmd>lua require('dap').step_over()<CR>", "Step over" },
		i = { "<Cmd>lua require('dap').step_into()<CR>", "Step into" },
		o = { "<Cmd>lua require('dap').step_out()<CR>", "Step out" },
		u = { "<Cmd>lua require('dapui').toggle()<CR>", "Toggle UI" },
		p = { "<Cmd>lua require('dap').repl.open()<CR>", "REPL" },
		X = { "<Cmd>lua require('dap').clear_breakpoints()<CR>", "Clear breakpoints" },
		e = { '<Cmd>lua require"telescope".extensions.dap.commands{}<CR>', "Commands" },
		f = { '<Cmd>lua require"telescope".extensions.dap.configurations{}<CR>', "Configurations" },
		r = { '<Cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', "List breakpoints" },
		v = { '<Cmd>lua require"telescope".extensions.dap.variables{}<CR>', "Variables" },
		m = { '<Cmd>lua require"telescope".extensions.dap.frames{}<CR>', "Frames" },
	},
	g = {
		name = "Git",
		d = { "<cmd>DiffviewOpen<cr>", "Diffview open" },
		B = { "<cmd>GitBlameToggle<cr>", "Toggle blame" },
		c = { "<cmd>DiffviewClose<cr>", "Diffview close" },
	},
	j = {
		name = "Jumps",
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
		m = {
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			"Open Menu",
		},
	},
	["1"] = { "<Cmd>lua require('harpoon.ui').nav_file(1) <Cr>", "Jump 1" },
	["2"] = { "<Cmd>lua require('harpoon.ui').nav_file(2) <Cr>", "Jump 2" },
	["3"] = { "<Cmd>lua require('harpoon.ui').nav_file(3) <Cr>", "Jump 3" },
	l = {
		name = "LSP",
		a = {
			"<cmd>lua vim.lsp.buf.code_action()<cr>",
			"Code Action",
		},
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
		f = {
			"<cmd>lua vim.lsp.buf.formatting()<cr>",
			"Format",
		},
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
		l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostics" },
		n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
		p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = {
			"<cmd>lua vim.lsp.buf.references()<cr>",
			"References",
		},
		R = {
			"<cmd>lua vim.lsp.buf.rename()<cr>",
			"Rename",
		},
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
	},
	m = {
		name = "Misc",
		d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble: Document Diagnostics" },
	},
	p = {
		name = "Project",
		p = {
			"<Cmd>Telescope project<Cr>",
			"List projects",
		},
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		h = { "<cmd>Telescope help_tags<cr>", "Man Pages" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
		r = { "<cmd>Telescope resume<cr>", "Resume Search" },
		s = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
		S = { "<cmd>Telescope symbols<cr>", "Search symbols" },
		w = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
	},
	t = {
		name = "Test",
		f = { "<cmd>TestFile<cr>", "File" },
		l = { "<cmd>TestLast<cr>", "Last" },
		t = { "<cmd>TestNearest<cr>", "Nearest" },
		s = { "<cmd>TestSuite<cr>", "Suite" },
		v = { "<cmd>TestVisit<cr>", "Visit" },
	},
	T = {
		name = "TypeScript",
		i = {
			"<cmd>TSLspImportAll<cr>",
			"Import All",
		},
		o = {
			"<cmd>TSLspOrganize<cr>",
			"Organize Imports",
		},
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
