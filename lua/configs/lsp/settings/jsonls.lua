local full_schemas = vim.tbl_deep_extend(
	"force",
	require("schemastore").json.schemas(),
	require("nlspsettings.jsonls").get_default_schemas()
)
local opts = {
	settings = {
		json = {
			schemas = full_schemas,
		},
	},
}

return opts
