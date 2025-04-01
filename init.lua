vim.g.mapleader = " "

require("rocks")
require("formatting")
require("config.lazy")
require("salesforce")

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.cmd("set number relativenumber")
vim.cmd("set mouse=")

-- Miscellaneous remaps. More remaps can be found in the individual plugin Lua files.
local file_mgr_cmd = "Oil"

vim.keymap.set("n", "<leader>glmr", "<cmd>!glab mr create --web --no-editor --fill<CR>")
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>pv", vim.cmd[file_mgr_cmd])

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.lsp.enable({
	"apex_ls",
	-- "gitlab_ci_ls",
	-- "gopls",
	-- "html",
	-- "jsonls",
	"lua_ls",
	-- "lwc_ls",
	-- "terraformls",
	-- "ts_ls",
	-- "visualforce_ls",
	-- "yamlls",
})
