vim.keymap.set("n", "<leader>pv", "<cmd>lua MiniFiles.open()<CR>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>glmr", "<cmd>!glab mr create --web --no-editor --fill<CR>")
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
