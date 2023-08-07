local api = vim.api

local function augroup(name)
	return vim.api.nvim_create_augroup("vim_" .. name, { clear = true })
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

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- auto open nvimtree on start
api.nvim_command("autocmd VimEnter * NvimTreeToggle")

-- wrap in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})
