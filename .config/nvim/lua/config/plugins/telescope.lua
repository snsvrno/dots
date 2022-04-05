return function(use) use {

	"nvim-telescope/telescope.nvim",

	requires = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		vim.cmd[[nnoremap <F1> <cmd>lua require('telescope.builtin').live_grep()<cr>]]
		vim.cmd[[nnoremap <F2> <cmd>lua require('telescope.builtin').buffers()<cr>]]
		vim.cmd[[nnoremap <F3> <cmd>lua require('telescope.builtin').git_files()<cr>]]
		vim.cmd[[nnoremap <F4> <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>]]
		vim.cmd[[nnoremap <F5> <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>]]
	end,

} end
