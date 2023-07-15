local Theme = { }

Theme.defineFile = ".config/theme"
Theme.defaultTheme = "dracula"
Theme.colors = nil

function Theme.getThemeName()
	local theme = os.getenv("THEME")
	if theme == nil then theme = Theme.defaultTheme end
	return theme
end

function Theme.setTheme()
	local theme = Theme.getThemeName()
	vim.cmd("colorscheme " .. theme)
end

function Theme.getColors()
	if Theme.colors == nil then
		local theme = Theme.getThemeName()
		Theme.colors = require('config.themes.' .. theme).colors
	end

	return Theme.colors
end

return Theme
