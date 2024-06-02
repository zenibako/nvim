vim.cmd("set number relativenumber")

vim.filetype.add({
	extension = { cls = 'apex', trigger = 'apex', page = 'html' },
})

vim.cmd("let g:fugitive_gitlab_domains = ['https://gitlab.odaseva.net']")
vim.cmd("let g:gitlab_api_keys = {'gitlab.odaseva.net': '" .. vim.env.GITLAB_TOKEN .. "'}")

require("zenibako.remap")
require("zenibako.lazy_init")
