return function(use) use {

	"kyazdani42/nvim-tree.lua",

	requires = {
		"kyazdani42/nvim-web-devicons",
	},

	config = function()
		require('nvim-tree').setup { }

		vim.cmd [[set termguicolors]]
		vim.cmd [[nnoremap <F12> :NvimTreeToggle<CR>]]
	end,


} end
