return {
	'stevearc/oil.nvim',

	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},

	config = function()
		require('oil').setup({
			view_options = {
				show_hidden = true,
			},
		})
	end,

	keys = {
		{
			"~",
			function()
				require('oil').open()
			end,
			desc = "Oil"
		}
	},
}
