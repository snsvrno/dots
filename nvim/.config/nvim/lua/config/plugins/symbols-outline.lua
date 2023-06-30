-- https://github.com/simrat39/symbols-outline.nvim

return {
	'simrat39/symbols-outline.nvim',

	config = function()
		require('symbols-outline').setup({})
	
			local so = require('symbols-outline')

			local m = require('config.mappings')
			m.n('so', so.toggle_outline, "symbols outline:toggle")
	end
}
