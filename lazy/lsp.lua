return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"b0o/schemastore.nvim",
		-- "schrieveslaach/sonarlint",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"gitlab_ci_ls",
				"apex_ls",
				"html",
				"lwc_ls",
				"visualforce_ls",
				"gopls",
				"ts_ls",
				"terraformls",
				"jsonls",
				"yamlls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,
				["lwc_ls"] = function()
					require("lspconfig").lwc_ls.setup({})
				end,
				["ts_ls"] = function()
					require("lspconfig").ts_ls.setup({
						settings = {
							implicitProjectConfiguration = {
								checkJs = true,
							},
						},
					})
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
				["apex_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.apex_ls.setup({
						filetypes = { "java", "trigger", "apex" },
						apex_jar_path = vim.fn.expand("$HOME/lib/apex-jorje-lsp.jar"),
						apex_enable_semantic_errors = true, -- Whether to allow Apex Language Server to surface semantic errors
						apex_enable_completion_statistics = true, -- Whether to allow Apex Language Server to collect telemetry on code completion usage
					})
				end,
				["terraformls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.terraformls.setup({
						filetypes = { "terraform", "terraform-vars", "hcl" },
					})
				end,
				["jsonls"] = function()
					require("lspconfig").jsonls.setup({
						settings = {
							json = {
								schemas = require("schemastore").json.schemas(),
								validate = { enable = true },
							},
						},
					})
				end,
				["visualforce_ls"] = function()
					require("lspconfig").visualforce_ls.setup({
            filetypes = { "visualforce", "page", "component" },
						settings = {
							cmd = {
								"node",
								vim.fn.expand("$HOME/Projects/salesforcedx-vscode/node_modules/@salesforce/salesforcedx-visualforce-language-server/out/src/visualforceServer.js"),
								"--stdio",
							},
						},
					})
				end,
				["yamlls"] = function()
					require("lspconfig").yamlls.setup({
						settings = {
							yaml = {
								schemaStore = {
									-- You must disable built-in schemaStore support if you want to use
									-- this plugin and its advanced options like `ignore`.
									enable = false,
									-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
									url = "",
								},
								schemas = require("schemastore").yaml.schemas(),
							},
						},
					})
				end,
				vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
					pattern = "*.gitlab-ci*.{yml,yaml}",
					callback = function()
						vim.bo.filetype = "yaml.gitlab"
					end,
				}),
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		--[[
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          -- Ensure that sonarlint-language-server uses stdio channel
          "-stdio",
          "-analyzers",
          -- paths to the analyzers you need, using those for python and java in this example
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        },
      },
      filetypes = {
        -- Tested and working
        "python",
        "cpp",
        "java",
      },
    })
    ]]
		--

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

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
