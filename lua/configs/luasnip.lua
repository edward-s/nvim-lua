local present, luasnip = pcall(require, "luasnip")
if not present then
	return
end

-- lazy loading so you only get in memory snippets of languages you use
require("luasnip/loaders/from_vscode").lazy_load()
luasnip.filetype_extend("typescript", { "javascript" })
luasnip.filetype_extend("typescriptreact", { "javascript" })
