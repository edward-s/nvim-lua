local M = {}

M.autoformat = true

function M.toggle()
	M.autoformat = not M.autoformat
	vim.notify(M.autoformat and "Enabled format on save" or "Disabled format on save")
end

function M.setup()
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("LspFormat", {}),
		callback = function(args)
			if M.autoformat then
				require("conform").format({ bufnr = args.buf })
			end
		end,
	})
end

return M
