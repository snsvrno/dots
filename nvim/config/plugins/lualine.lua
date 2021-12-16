local options = {
	icons_enabled = true,
}

if (config_interchange.lualine_theme) then
	options.theme = config_interchange.lualine_theme 
end

require('lualine').setup { options = options }
