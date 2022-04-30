local opts = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 1000,
			},
		},
	},
}

return opts
