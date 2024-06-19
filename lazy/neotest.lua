return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"nvim-neotest/neotest-jest",
			commit = "c211844",
		},
	},
	config = function ()
		require("neotest").setup({
			--[[ require('neotest-jest')({
				jestCommand = require('neotest-jest.jest-util').getJestCommand(vim.fn.expand '%:p:h') .. ' --watchAll',
				jestConfigFile = "jest.config.js",
				env = { CI = true },
				cwd = function(path)
					return vim.fn.getcwd()
				end,
			}), ]]
		})
	end
}
