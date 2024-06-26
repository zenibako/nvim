vim.cmd("set number relativenumber")

vim.filetype.add({
	extension = { cls = 'apex', trigger = 'apex', page = 'html', apex = 'apex' },
})

vim.cmd("let g:fugitive_gitlab_domains = ['https://gitlab.odaseva.net']")
-- vim.cmd("let g:gitlab_api_keys = {'gitlab.odaseva.net': '" .. vim.env.GITLAB_TOKEN .. "'}")

vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")

require("zenibako.remap")
require("zenibako.lazy_init")
