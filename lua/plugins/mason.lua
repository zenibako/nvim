return {
	"williamboman/mason.nvim",
	dependencies = {
		"j-hui/fidget.nvim",
		"b0o/schemastore.nvim",
		-- "schrieveslaach/sonarlint",
	},

	config = function()
		require("fidget").setup({})
		require("mason").setup()

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
