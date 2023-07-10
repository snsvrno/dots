local prefix = "g"

return {
	'NeogitOrg/neogit',

	dependencies = {
		'nvim-lua/plenary.nvim'
	},

	config = function ()
		local neogit = require('neogit')
		neogit.setup({ })

		local m = require('config.mappings')
		m.n(prefix .. 'g', neogit.open, 'Default')

		m.prefix(prefix, "Neogit")
	end
}
