local function config()
	require('neogit').setup()
end

local function neogit_open()
	require('neogit').open()
end

return {
	'NeogitOrg/neogit',
	config = config,
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	keys = {
		{ "<leader>g", neogit_open, desc = "Default" },
	},
}
