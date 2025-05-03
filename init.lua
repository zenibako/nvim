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

local ensured_lsp_names = {
  "astro",
	"apex_ls",
	"gopls",
	"html",
	"jsonls",
	"lwc_ls",
	"terraformls",
	-- "ts_ls",
	"visualforce_ls",
	"yamlls",
}
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = ensured_lsp_names })

local all_lsp_names = {
	"gitlab_ci_ls",
	"lua_ls",
  unpack(ensured_lsp_names)
}
vim.lsp.enable(all_lsp_names)
