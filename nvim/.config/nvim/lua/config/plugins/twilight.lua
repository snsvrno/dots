-- https://github.com/folke/twilight.nvim

return {
	'folke/twilight.nvim',

	config = function()
		require('twilight').setup({ })

		local tw = require('twilight')

		local m = require('config.mappings')
		m.n('dd', tw.toggle, "Toggle Twilight")
	end,
}
