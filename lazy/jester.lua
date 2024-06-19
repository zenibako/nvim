return {
	"David-Kunz/jester",
	config = function()
		require("jester").setup({
			dap = require("dap").configurations["typescript"]
		})
	end,
}
