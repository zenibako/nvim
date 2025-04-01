return {
	filetypes = { "visualforce", "page", "component" },
	settings = {
		cmd = {
			vim.fn.expand(
				"$HOME/.local/share/nvim/mason/packages/visualforce-language-server/visualforce-language-server"
			),
			"--stdio",
		},
	},
}
