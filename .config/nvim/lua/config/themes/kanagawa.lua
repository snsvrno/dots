return function(use)
	use {
		'rebelot/kanagawa.nvim',

		config = function()

			vim.opt.fillchars:append({
				horiz = '━',
				horizup = '┻',
				horizdown = '┳',
				vert = '┃',
				vertleft = '┨',
				vertright = '┣',
				verthoriz = '╋',
			})

			require('kanagawa').setup {
				undercurls = true,
				statementStyle = "bold",
				keywordStyle = "italic",

				transparent = true,
				dimInteractive = true,
				specialReturn = true,
				specialException = true,
			}

			vim.cmd [[ colorscheme kanagawa ]]
		end,
	}
end
