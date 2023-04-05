local api = vim.api

-- windows to close
api.nvim_create_autocmd("FileType", {
	pattern = {
		"checkhealth",
		"neotest-attach",
		"neotest-output",
		"neotest-summary",
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
