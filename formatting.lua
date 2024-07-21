vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
