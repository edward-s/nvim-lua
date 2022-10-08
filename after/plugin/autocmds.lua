local api = vim.api

-- windows to close
api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
		"toggleterm",
	},
	command = [[nnoremap <buffer><silent> q :close<CR>]],
})

api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})
