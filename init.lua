vim.g.mapleader = " "

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.cmd("set number relativenumber")

-- Miscellaneous remaps. More remaps can be found in the individual plugin Lua files.
vim.keymap.set("n", "<leader>glmr", "<cmd>!glab mr create --web --no-editor --fill<CR>")
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

require("zenibako.formatting")
require("zenibako.lazy_init")
require("zenibako.salesforce")

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

