return {
	"zenibako/salesforce.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"folke/which-key.nvim",
	},
	config = function()
		require("salesforce").setup({
			debug = {
				to_file = true,
				to_command_line = false,
			},
			popup = {
				-- The width of the popup window.
				width = 160,
				-- The height of the popup window.
				height = 45,
				-- The border characters to use for the popup window
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			file_manager = {
				ignore_conflicts = false, -- ignores conflicts on "sf project retrieve/deploy"
			},
			org_manager = {
				default_org_indicator = "󰄬",
			},
			-- Default SF CLI executable (should not need to be changed)
			sf_executable = "sf",
		})

	end,
}
