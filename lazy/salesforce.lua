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
		local get_deploy_cmd = function(file_path)
      local deploy_cmd = "!sf project deploy start"
      if file_path == nil then
        return deploy_cmd
      end

			local class_name = file_path:match(".*/(.-)%.cls")
			if class_name == nil then
				return deploy_cmd
			end

			return deploy_cmd .. " --metadata ApexClass:" .. class_name
		end

		wk.register({
			d = {
				name = "Deploy to Salesforce",
				c = { file_manager.push_to_org, "Deploy This File Only" },
				p = { "<cmd>!sf project deploy start<cr>", "Deploy Project" },
				t = {
					name = "Deploy and Run Apex Tests",
					p = {
						function()
							vim.cmd("!sf project deploy start")
							vim.cmd("!sf apex run test --synchronous")
						end,
						"Deploy Project and Run All Tests",
					},
					c = {
						function()
							vim.cmd(get_deploy_cmd(vim.api.nvim_buf_get_name(0)))
							test_runner.execute_current_class()
						end,
						"Deploy and Run Current Test Class",
					},
					m = {
						function()
							vim.cmd(get_deploy_cmd(vim.api.nvim_buf_get_name(0)))
							test_runner.execute_current_method()
						end,
						"Deploy and Run Current Test Method",
					},
				},
			},
			t = {
				name = "Run Salesforce Apex Tests",
				p = { "<cmd>!sf apex run test --synchronous<cr>", "Run All Tests" },
				c = { test_runner.execute_current_class, "Run Current Test Class" },
				m = { test_runner.execute_current_method, "Run Current Test Method" },
			},
			o = {
				name = "Manage Salesforce Orgs",
				o = { "<cmd>!sf org open<cr>", "Open Default Org" },
				l = { "<cmd>!sf org list<cr>", "List Orgs" },
			},
		}, { prefix = "<leader>sf" })
	end,
}
