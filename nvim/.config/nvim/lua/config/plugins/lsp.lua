local function config()
	local m = require('config.mappings')
	m.prefix('l', 'LSP')
end

local mason_settings = {
	ensure_installed = {
		"haxe_language_server",
		"lua_ls",
	},
}

local function config_mason()
	require('mason-lspconfig').setup(mason_settings);

	local cmp = require('cmp_nvim_lsp').default_capabilities()
	local lspc = require('lspconfig')

	lspc.haxe_language_server.setup ({ capabilities = cmp })
	lspc.lua_ls.setup ({ capabilities = cmp })
end

---------------------------------------------------------------------

return {
	{
		'neovim/nvim-lspconfig',
		config = config,
		keys = {
			{ '<leader>lr', vim.lsp.buf.rename, 'Rename' },
			{ '<leader>lD', vim.lsp.buf.declaration, 'Declaration' },
			{ '<leader>ld', vim.lsp.buf.definition, 'Definition' },
			{ '<leader>lk', vim.lsp.buf.hover, 'Hover' },
			{ '<leader>li', vim.lsp.buf.implementation, 'Implementation' },
			{ '<leader>lK', vim.lsp.buf.signature_help, 'Signature Help' },
			{ '<leader>lc', vim.lsp.buf.code_action, 'Code Action' },
			{ '<leader>lR', vim.lsp.buf.references, 'References' },
		},
	},
	{
		'williamboman/mason.nvim',
		config = function() require('mason').setup() end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = config_mason,
		dependencies = {
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
		},
	},
}
