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
})

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local v_opts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
}

local function normal_keymap()
	local keymap = {
		["e"] = { "<cmd>lua require('dapui').eval()<cr>", "Dap Eval" },
		["h"] = { "<cmd>nohlsearch<cr>", "No Highlight Search" },
		["m"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Harpoon mark" },
		["q"] = { "<cmd>lua require('utils').quit()<CR>", "Quit" },
		["w"] = { "<cmd>w<cr>", "Save" },
		[","] = { "zA", "Toggle All Folds" },
		["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "File 1" },
		["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "File 2" },
		["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "File 3" },
		b = {
			name = "Buffers",
			a = { "<cmd>silent BufOnly<cr>", "Close other buffers" },
			b = { "<cmd>Telescope buffers<cr>", "Buffers" },
			c = { "<cmd>BufferLinePickClose<cr>", "Close buffer" },
			d = { "<cmd>Bdelete<cr>", "Close current" },
			p = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
		},
		c = {
			name = "Code",
			o = { "<cmd>AerialToggle<cr>", "Code Outline" },
			t = { "<cmd>TodoTelescope<cr>", "TODO" },
		},
		d = {
			name = "Debug",
			b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },
			c = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
			d = { "<cmd>lua require('dap').run_to_cursor()<cr>", "Run to cursor" },
			e = { "<cmd>lua require('dapui').eval()<cr>", "Eval" },
			h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
			s = { "<cmd>lua require('dap').step_over()<cr>", "Step over" },
			i = { "<cmd>lua require('dap').step_into()<cr>", "Step into" },
			o = { "<cmd>lua require('dap').step_out()<cr>", "Step out" },
			p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
			r = { "<cmd>lua require('dap').repl.toggle()<cr>", "Toggle REPL" },
			q = { "<cmd>lua require('dap').terminate()<cr>", "Terminate" },
			u = { "<cmd>NvimTreeClose<cr><cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
			x = { "<cmd>lua require('dap').clear_breakpoints()<cr>", "Clear breakpoints" },
		},
		g = {
			name = "Git",
			b = { "<cmd>GitBlameToggle<cr>", "Toggle blame" },
			B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
			d = { '<cmd>lua require("configs.diffview").toggle()<cr>', "Diff working file" },
			g = { "<cmd>lua require('utils.term').lazygit_toggle()<cr>", "LazyGit" },
			h = { '<cmd>lua require("configs.diffview").toggle_file_history()<cr>', "Diff file history" },
		},
		j = {
			name = "Jump",
			j = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Jump Menu" },
		},
		l = {
			name = "LSP",
			a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
			d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
			D = { "<cmd>Lspsaga peek_definition<cr>", "Peek Definition" },
			e = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Buffer diagnostics" },
			f = { "<cmd>Lspsaga lsp_finder<cr>", "Lsp Finder" },
			k = { "<cmd>Lspsaga hover_doc<cr>", "Hover doc" },
			l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line diagnostics" },
			r = { "<cmd>Lspsaga rename<cr>", "Rename" },
			w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
		},
		s = {
			name = "Search",
			f = { "<cmd>Telescope find_files<cr>", "Find" },
			g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			h = { "<cmd>Telescope help_tags<cr>", "Man Pages" },
			m = { "<cmd>Telescope marks<cr>", "Marks" },
			o = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
			r = { "<cmd>Telescope resume<cr>", "Resume Search" },
			s = { "<cmd>lua require('utils.term').so()<cr>", "Stack Overflow" },
			w = { "<cmd>Telescope grep_string<cr>", "Text under cursor" },
		},
		t = {
			name = "Test",
			a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
			d = {
				function()
					local buf = vim.api.nvim_get_current_buf()
					local ft = vim.api.nvim_buf_get_option(buf, "filetype")
					if ft == "go" then
						-- temporary fix until neotest is updated to support go
						require("dap-go").debug_test()
					else
						require("neotest").run.run({ strategy = "dap" })
					end
				end,
				"Debug Nearest",
			},
			f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
			l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
			m = { "<cmd>lua require('neotest').summary.run_marked()<cr>", "Run Marked" },
			o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
			s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
			S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
			t = { "<cmd>lua require('neotest').run.run()<cr>", "Nearest" },
		},
		z = {
			name = "Window",
			c = { "<cmd>tabclose<cr>", "Close tab" },
			v = { "<cmd>vsplit<cr>", "Vertical split" },
			r = { "<c-w>r", "Swap" },
			t = { "<cmd>tabnew %<cr>", "New tab" },
			x = { "<cmd>split<cr>", "Horizontal split" },
			z = { "<cmd>ZenMode<cr>", "Zen mode" },
			["="] = { "<c-w>=", "Equally size" },
		},
	}

	which_key.register(keymap, opts)
end

local function visual_keymap()
	local keymaps = {}

	which_key.register(keymaps, v_opts)
end

local function code_keymap()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "*",
		callback = function()
			vim.schedule(CodeRunner)
		end,
	})

	function CodeRunner()
		local bufnr = vim.api.nvim_get_current_buf()
		local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
		local fname = vim.fn.expand("%:p:t")
		local keymap_c = {} -- normal key map
		local keymap_c_v = {} -- visual key map

		if ft == "typescript" or ft == "typescriptreact" or ft == "javascript" or ft == "javascriptreact" then
			keymap_c = {
				name = "Code",
				f = { "<cmd>TypescriptFixAll<cr>", "Fix all" },
				i = { "<cmd>TypescriptAddMissingImports<cr>", "Add Missing Imports" },
				o = { "<cmd>TypescriptOrganizeImports<cr>", "Organize Imports" },
				r = { "<cmd>TypescriptRenameFile<cr>", "Rename File" },
				u = { "<cmd>TypescriptRemoveUnused<cr>", "Remove Unused" },
			}
		end

		if next(keymap_c) ~= nil then
			local k = { c = keymap_c }
			local o = { mode = "n", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
			which_key.register(k, o)
		end

		if next(keymap_c_v) ~= nil then
			local k = { c = keymap_c_v }
			local o = { mode = "v", silent = true, noremap = true, buffer = bufnr, prefix = "<leader>", nowait = true }
			which_key.register(k, o)
		end
	end
end

normal_keymap()
visual_keymap()
code_keymap()
