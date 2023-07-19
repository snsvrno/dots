local function config()
	require('oil').setup({
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["="] = "actions.parent",
		}
	})
end

local function open_oil()
	require('oil').open()
end

return {
	'stevearc/oil.nvim',
	config = config,
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	keys = {
		{ "`", open_oil, desc = "Oil" },
	},
}
