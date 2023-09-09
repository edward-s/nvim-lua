local api = vim.api

local function augroup(name)
	return api.nvim_create_augroup("vim_" .. name, { clear = true })
end

-- windows to close
api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"checkhealth",
		"neotest-attach",
		"neotest-output",
		"neotest-summary",
		"neotest-output-panel",
		"qf",
		"toggleterm",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- do not autocomment new line
api.nvim_create_autocmd({ "BufWinEnter" }, {
	group = augroup("auto_format_options"),
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- wrap in text filetypes
api.nvim_create_autocmd("FileType", {
	group = augroup("wrap"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})
