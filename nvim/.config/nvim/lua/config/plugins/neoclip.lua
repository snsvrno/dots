-- https://github.com/AckslD/nvim-neoclip.lua

return {
	'AckslD/nvim-neoclip.lua',

	dependencies = {
		'nvim-telescope/telescope.nvim'
	},

	config = function()
		require('neoclip').setup({

		})

		local telescope = require('telescope')
		telescope.load_extension('neoclip')

		local m = require('config.mappings')
		m.n('tn', telescope.extensions.neoclip.neoclip, "Neoclip")
	end,
}
