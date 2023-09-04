local M = {}

function M.on_attach(client, buffer)
	local self = M.new(client, buffer)

	self:map("gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
	self:map("gD", "Lspsaga peek_definition", { desc = "Peek Definition" })
	self:map("gf", "Lspsaga finder", { desc = "Lsp finder" })
	self:map("K", "Lspsaga hover_doc", { desc = "Hover" })
	self:map("gK", vim.lsp.buf.signature_help, { desc = "Signature Help", has = "signatureHelp" })
	self:map("gy", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
	self:map("gY", "Lspsaga peek_type_definition", { desc = "Peek Type Definition" })
	self:map("]d", M.diagnostic_goto(true), { desc = "Next Diagnostic" })
	self:map("[d", M.diagnostic_goto(false), { desc = "Prev Diagnostic" })
	self:map("]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
	self:map("[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
	self:map("]w", M.diagnostic_goto(true, "WARN"), { desc = "Prev Warning" })
	self:map("[w", M.diagnostic_goto(false, "WARN"), { desc = "Next Warning" })

	self:map("<leader>ca", "Lspsaga code_action", { desc = "Code Action", mode = { "n", "v" }, has = "codeAction" })
	self:map("<leader>cl", "Lspsaga show_line_diagnostics", { desc = "Line Diagnostics" })
	self:map("<leader>cr", "Lspsaga rename", { desc = "Rename" })
end

function M.new(client, buffer)
	return setmetatable({ client = client, buffer = buffer }, { __index = M })
end

function M:has(cap)
	return self.client.server_capabilities[cap .. "Provider"]
end

function M:map(lhs, rhs, opts)
	opts = opts or {}
	if opts.has and not self:has(opts.has) then
		return
	end
	vim.keymap.set(
		opts.mode or "n",
		lhs,
		type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
		---@diagnostic disable-next-line: no-unknown
		{ silent = true, buffer = self.buffer, expr = opts.expr, desc = opts.desc }
	)
end

function M.diagnostic_goto(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end

return M
