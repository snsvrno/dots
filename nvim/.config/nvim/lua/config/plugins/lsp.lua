local prefix = "l"

return {
	{
		'neovim/nvim-lspconfig',

		config = function()

			local m = require('config.mappings')
			m.n(prefix .. 'r', vim.lsp.buf.rename, 'Rename')
			m.n(prefix .. 'D', vim.lsp.buf.declaration, 'Declaration')
			m.n(prefix .. 'd', vim.lsp.buf.definition, 'Definition')
			m.n(prefix .. 'k', vim.lsp.buf.hover, 'Hover')
			m.n(prefix .. 'i', vim.lsp.buf.implementation, 'Implementation')
			m.n(prefix .. 'K', vim.lsp.buf.signature_help, 'Signature Help')
			m.n(prefix .. 'c', vim.lsp.buf.code_action, 'Code Action')
			m.n(prefix .. 'R', vim.lsp.buf.references, 'References')

			m.prefix(prefix, "LSP")

		end,
	},

	{
		"williamboman/mason.nvim",

		config = function()
			require('mason').setup({

			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",

		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},

		config = function()

			require('mason-lspconfig').setup({
				ensure_installed = {
					"haxe_language_server",
				},
			})

			local cmp = require('cmp_nvim_lsp').default_capabilities()
			local lspc = require('lspconfig')

			lspc.haxe_language_server.setup ({ capabilities = cmp })
			lspc.lua_ls.setup ({ capabilities = cmp })

		end,
	},


}
