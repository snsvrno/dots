return {
	"nvim-treesitter/nvim-treesitter",

	config = function()

		require('nvim-treesitter.parsers').get_parser_configs().haxe = ({
			install_info = {
				url = "https://github.com/vantreeseba/tree-sitter-haxe",
				files = {"src/parser.c"},
				branch = "main",
			},
		})

		require('nvim-treesitter.configs').setup({
			ensure_installed = { "haxe", "toml", "markdown", "git_rebase", "lua" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})

		vim.filetype.add({
			extension = {
				hx = "haxe",
			},
		})

	end
}
