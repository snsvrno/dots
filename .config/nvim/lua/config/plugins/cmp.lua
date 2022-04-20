return function(use) use {

	"hrsh7th/nvim-cmp",

	requires = {
		"onsails/lspkind.nvim"
	},

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

		setup_options.formatting = {
			format = require('lspkind').cmp_format()
		}

		setup_options.mapping = {
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			['<C-e>'] = cmp.mapping.close(),
			['<CR>'] = cmp.mapping.confirm({
				select = false -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			['<Up>'] = cmp.mapping(function(fallback)
				if cmp.visible() then cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then luasnip.jump(-1)
				else fallback()
				end
			end, { 'i', 's' }),
			['<Down>'] = cmp.mapping(function(fallback)
				if cmp.visible() then cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
				else fallback()
				end
			end, { 'i', 's' }),

		}


		setup_options.sources = { }
		if (luasnip) then table.insert(setup_options.sources, { name = 'luasnip' }) end
		if (require("lspconfig")) then table.insert(setup_options.sources, { name = 'nvim_lsp' }) end

		-------------------------------------------------

		cmp.setup(setup_options)

		-------------------------------------------------
	end,

} end
