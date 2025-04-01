---@type vim.lsp.Config
return {
	settings = {
		Lua = {
			runtime = { version = "Lua 5.1" },
			diagnostics = {
				globals = { "vim", "it", "describe", "before_each", "after_each" },
			},
		},
	},
}
