return function(use)
	use {
		'rebelot/kanagawa.nvim',

		config = function()

			require('kanagawa').setup {
				undercurls = true,
				statementStyle = "bold",
				keywordStyle = "italic",
				transparent = true,
				dimInteractive = true,
			}

			vim.cmd [[ colorscheme kanagawa ]]

		end,
	}
end
