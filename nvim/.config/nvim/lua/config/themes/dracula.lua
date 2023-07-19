return {
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
	end,
}
