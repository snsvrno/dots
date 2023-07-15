return {

	colors = {
		black = "#21222c",
		red = "#ff5555",
		green = "#50fa7b",
		yellow = "#f1fa8c",
		blue = "#bd93f9",
		magenta = "#ff79c6",
		cyan ="#8be9fd",
		white ="#f8f8f2",
		bright_black ="#6272a4",
		bright_red ="#ff6e6e",
		bright_green = "#69ff94",
		bright_yellow = "#ffffa5",
		bright_blue = "#dbacff",
		bright_magenta = "#ff92df",
		bright_cyan = "#a4ffff",
		bright_white = "#ffffff",
	},

	lazy = {
		'Mofiqul/dracula.nvim',

		config = function()

			require('dracula').setup({
				transparent_bg = true,
				italic_comment = true,
				overrides = function(c)
					return {

						-- TELESCOPE

						TelescopePromptNormal = { fg = c.bg, bg = c.purple, },
						TelescopePromptBorder = { fg = c.orange, bg = c.purple, },
						TelescopeNormal = { bg = c.menu, },
						TelescopeBorder = { fg = c.orange, bg = c.menu, },
						TelescopeResultsBorder = { bg = c.menu, },
						TelescopePreviewBorder = { bg = c.menu, },

						-- WHICHKEY

						WhichKey = { bg = c.menu, },
						WhichKeySeparator = { fg = c.pink, bg = c.menu, },
						WhichKeyDesc = { fg = c.orange, bg = c.menu, },
						WhichKeyGroup = { fg = c.cyan, bg = c.menu, },
						WhichKeyValue = { fg = c.purple, bg = c.menu, },
						WhichKeyBorder = { bg = c.menu, },
						WhichKeyFloat = { bg = c.menu, },
					}

				end
			})

		end
	}
}
