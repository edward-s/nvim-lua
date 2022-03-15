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
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
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
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
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
	f = {
		name = "Files",
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
	},
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		g = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		B = { "<cmd>GitBlameToggle<cr>", "Toggle Blame" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
	},
	h = {
		name = "Harpoon",
		a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add File" },
		m = {
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			"Open Menu",
		},
		["1"] = {
			"<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
			"Open File 1",
		},
		["2"] = {
			"<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
			"Open File 2",
		},
		["3"] = {
			"<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
			"Open File 3",
		},
		["4"] = {
			"<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
			"Open File 4",
		},
	},
	l = {
		name = "LSP",
		a = {
			"<cmd>lua vim.lsp.buf.code_action()<cr>",
			"Code Action",
		},
		A = {
			"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
			"Add Workspace Folder",
		},
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
		e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
		f = {
			"<cmd>lua vim.lsp.buf.formatting()<cr>",
			"Format",
		},
		i = {
			"<cmd>lua vim.lsp.buf.implementation()<cr>",
			"Show implementations",
		},
		I = {
			"<cmd>TSLspImportAll<cr>",
			"TS: Import All",
		},
		k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
		K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
		l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostics" },
		L = {
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
			"List Workspace Folders",
		},
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
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
		W = {
			"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
			"Remove Workspace Folder",
		},
		w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
	},
	m = {
		name = "Misc",
		z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
	},
	s = {
		name = "Search",
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		h = { "<cmd>Telescope help_tags<cr>", "Man Pages" },
		r = { "<cmd>Telescope resume<cr>", "Resume Search" },
		s = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
	},
	t = {
		name = "Trouble",
		w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
		d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostic" },
		l = { "<cmd>Trouble loclist<cr>", "Loclist" },
		q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
		t = { "<cmd>TodoTrouble<cr>", "Todos" },
		r = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
	},
	["vt"] = {
		name = "Vim Test",
		t = { "<cmd>TestNearest<cr>" },
		T = { "<cmd>TestFile<cr>" },
		a = { "<cmd>TestSuite<cr>" },
	},
}

which_key.register(mappings, opts)
