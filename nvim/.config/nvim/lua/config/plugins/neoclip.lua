-- https://github.com/AckslD/nvim-neoclip.lua

local function config()
	require('neoclip').setup()
	--local telescope = require('telescope')
	--telescope.load_extension('neoclip')
end

return {
	'AckslD/nvim-neoclip.lua',
	config = config,
	dependencies = {
		'nvim-telescope/telescope.nvim'
	},
	--[[keys = {
		{ '<leader>tn', require('telescope').extensions.neoclip.neoclip, "Newclip" }
	},--]]
}
