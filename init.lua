vim.g.mapleader = " "

require("config.formatting")
require("config.lazy")
require("config.keymaps")
-- require("config.rocks")
require("config.salesforce")

vim.opt.hlsearch = true

vim.cmd("set number relativenumber")
vim.cmd("set mouse=")

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

local lsp_names = {
	"apex_ls",
	"gitlab_ci_ls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"lwc_ls",
	"terraformls",
	-- "ts_ls",
	"visualforce_ls",
	"yamlls",
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = lsp_names,
})

vim.lsp.enable(lsp_names)
