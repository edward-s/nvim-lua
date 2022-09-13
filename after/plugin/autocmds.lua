local api = vim.api

-- windows to close
api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
		"toggleterm",
	},
	command = [[nnoremap <buffer><silent> q :close<CR>]],
})
