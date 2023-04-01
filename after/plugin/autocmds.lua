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

local group = api.nvim_create_augroup("NeotestConfig", {})
for _, ft in ipairs({ "output", "attach", "summary" }) do
	api.nvim_create_autocmd("FileType", {
		pattern = "neotest-" .. ft,
		group = group,
		callback = function(opts)
			vim.keymap.set("n", "q", function()
				pcall(api.nvim_win_close, 0, true)
			end, {
				buffer = opts.buf,
			})
		end,
	})
end
