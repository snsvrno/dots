return function(use) use {

	"nvim-lua/plenary.nvim",

	config = function()

		require("plenary.filetype").add_table {
			extension = {
				['hx'] = 'haxe',
				['hxs'] = 'haxe',
			}
		}

	end,

} end
