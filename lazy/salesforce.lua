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

	local wk = require("which-key")
	local test_runner = require("salesforce.test_runner")
	local file_manager = require("salesforce.file_manager")
	wk.register({
	  d = {
	    name = "Deploy to Salesforce",
	    f = { file_manager.push_to_org, "Deploy This File Only" },
	    p = { "<cmd>!sf project deploy start<cr>", "Deploy Project" },
	    t = {
		name = "Deploy and Run Apex Tests",
		a = { function()
			vim.cmd("!sf project deploy start")
			vim.cmd("!sf apex run test --synchronous")
		end, "Deploy Project and Run All Tests" },
		m = { function()
			vim.cmd("!sf project deploy start")
			test_runner.execute_current_class()
		end, "Deploy Project and Run Current Test Class" },
		c = { function()
			vim.cmd("!sf project deploy start")
			test_runner.execute_current_method()
		end, "Deploy Project and Run Current Test Method" },
	    },
	  },
	  t = {
	    name = "Run Salesforce Apex Tests",
	    a = { "<cmd>!sf apex run test --synchronous<cr>", "Run All Tests" },
	    m = { test_runner.execute_current_class, "Run Current Test Class" },
	    c = { test_runner.execute_current_method, "Run Current Test Method" },
	  },
	  o = {
	    name = "Manage Salesforce Orgs",
	    o = { "<cmd>!sf org open<cr>", "Open Default Org" },
	    l = { "<cmd>!sf org list<cr>", "List Orgs" },
	  },
	}, { prefix = "<leader>s" })
    end
}
