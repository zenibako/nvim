return {
    "jonathanmorris180/salesforce.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("salesforce").setup({
	    debug = {
		to_file = false,
		to_command_line = false,
	    },
	    popup = {
		-- The width of the popup window.
		width = 100,
		-- The height of the popup window.
		height = 20,
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

        vim.keymap.set('n', '<leader>sfd', require("salesforce.file_manager").push_to_org, {})
    end
}
