return function(use)
	use {
		"airblade/vim-gitgutter",

		config = function()
			vim.cmd [[let g:gitgutter_sign_added=""]]
			vim.cmd [[let g:gitgutter_sign_modified = '']]
			vim.cmd [[let g:gitgutter_sign_removed = '']]
			vim.cmd [[let g:gitgutter_sign_removed_first_line = '^^']]
			vim.cmd [[let g:gitgutter_sign_removed_above_and_below = '{']]
			vim.cmd [[let g:gitgutter_sign_modified_removed = 'ww']]
		end

	}
end
