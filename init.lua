vim.cmd("set number relativenumber")

vim.filetype.add({
	extension = { cls = 'apex' }
})

require("zenibako.remap")
require("zenibako.lazy_init")
