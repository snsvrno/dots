return function(use) use {

	"hrsh7th/nvim-cmp",

	config = function()
		-------------------------------------------------

		local luasnip = require('luasnip')
		local cmp = require('cmp')

		-------------------------------------------------

		local setup_options = { }

		-- links luasnap if its loaded.
		if (luasnip) then setup_options.snippet = {
			expand = function(args) luasnip.lsp_expand(args.body) end,
		} end

		setup_options.mapping = {
			['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
			['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
			['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
			['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			['<C-e>'] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}

		setup_options.sources = { }
		if (luasnip) then table.insert(setup_options.sources, { name = 'luasnip' }) end
		if (require("lspconfig")) then table.insert(setup_options.sources, { name = 'nvim_lsp' }) end

		-------------------------------------------------

		cmp.setup(setup_options)

		-------------------------------------------------
	end,

} end
