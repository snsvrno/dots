-- https://github.com/folke/twilight.nvim

local function config()
	require('twilight').setup()
end

local function tw_toggle()
	require('twilight').toggle()
end

return {
	'folke/twilight.nvim',
	config = config,
	keys = {
		{ '<leader>dd', tw_toggle, desc = "Toggle Twilight" },
	},
}
