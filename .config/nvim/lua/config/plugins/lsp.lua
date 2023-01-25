return function(use) use {

	"neovim/nvim-lspconfig",

	requires = {
		"hrsh7th/cmp-nvim-lsp"
	},

	config = function ()

		-- Add additional capabilities supported by nvim-cmp
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

		-- setup the haxe server.
		require ('lspconfig').haxe_language_server.setup {
			cmd = { "node", "/home/snsvrno/Source/haxe-language-server/bin/server.js" },
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				local navic = require("nvim-navic")
				if navic ~= nil then navic.attach(client, bufnr) end
			end
		}

	end,

} end
