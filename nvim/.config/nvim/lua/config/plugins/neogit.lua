local prefix = "g"

local function config()
	local neogit = require('neogit')
	neogit.setup({ })

	local m = require('config.mappings')
	m.prefix(prefix, "Neogit")
end

local function open_git()
	require('neogit').open()
end

return {
	'NeogitOrg/neogit',

	dependencies = {
		'nvim-lua/plenary.nvim'
	},

	config = config,

	keys = {
		{ "<leader>gg", open_git, desc = "Default" },
	},
}
