return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
		    sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.completion.spell,
			null_ls.builtins.diagnostics.pmd.with({
				extra_args = {
				    "--rulesets",
				    "category/apex/security.xml" -- or path to self-written ruleset
				},
			}),
			require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
		    },
		})
	end,
}
