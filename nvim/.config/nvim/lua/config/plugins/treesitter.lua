-- copy local queries to the lazy treesitter
local function copy_queries(name, path)
	local qpath = "/home/snsvrno/.local/share/nvim/lazy/nvim-treesitter/queries/" .. name

	if io.open(qpath) == nil then
		os.execute("mkdir " .. qpath)
		os.execute("cp " .. path .. "/queries/* " .. qpath)
	end
end

local function git_queries(name, url)
	local qpath = "/home/snsvrno/.local/share/nvim/lazy/nvim-treesitter/queries/" .. name

	if io.open(qpath) == nil then
		os.execute("mkdir " .. qpath)
		os.execute("git clone " .. url .. " /tmp/tslang")
		os.execute("cp /tmp/tslang/queries/* " .. qpath)
	end
end

local function setup_haxe()
	local url = 'https://github.com/vantreeseba/tree-sitter-haxe'

	require('nvim-treesitter.parsers').get_parser_configs().haxe = ({
		install_info = {
			url = url,
			files = {'src/parser.c'},
			branch = 'main',
		},
	})

	git_queries("haxe", url)

	vim.filetype.add({
		extension = { hx = 'haxe', },
	})
end

local function setup_local_hxml()
	local path = "/home/snsvrno/Projects/tools/tree-sitter-hxml"

	if io.open(path .. "/grammar.js") == nil then
		return false
	end

	require('nvim-treesitter.parsers').get_parser_configs().hxml = ({
		install_info = {
			url = '~/Projects/tools/tree-sitter-hxml',
			files = {'src/parser.c'},
			branch = 'main',
		},
		filetype = "hxml"
	})

	copy_queries("hxml", path)

	vim.filetype.add({
		extension = { hxml = 'hxml', },
	})

	return true
end

local function config()

	local ensure_installed = {
		'haxe',
		'toml',
		'markdown',
		'git_rebase',
		'gitcommit',
		'gitignore',
		'glsl',
		'lua'
	}

	setup_haxe()
	if setup_local_hxml() then ensure_installed[#ensure_installed+1] = 'hxml' end

	require('nvim-treesitter.configs').setup({
		ensure_installed = ensure_installed,
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
