-- will return the current nvim color scheme. but has
-- some allowances for overrides in the case a theme i use
-- does not have a lualine theme.
local function theme()
	local theme_name = vim.g.color_name
	return theme_name
end

local options = {
	icons_enabled = true,
	theme = theme(),
}

require('lualine').setup { options = options }
