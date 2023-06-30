return {
	"ecthelionvi/NeoColumn.nvim",

	config = function()
		local col = require('NeoColumn')

		col.setup()
		col.toggle_neocolumn()
	end
}
