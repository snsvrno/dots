local function setup_haxe()

	require('nvim-treesitter.parsers').get_parser_configs().haxe = ({
		install_info = {
			url = 'https://github.com/vantreeseba/tree-sitter-haxe',
			files = {'src/parser.c'},
			branch = 'main',
		},
	})

	vim.filetype.add({
		extension = { hx = 'haxe', },
	})

end

local function config()
	setup_haxe()

	require('nvim-treesitter.configs').setup({
		ensure_installed = { 'haxe', 'toml', 'markdown', 'git_rebase', 'lua' },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})

end

return {
	'nvim-treesitter/nvim-treesitter',
	config = config,
}
