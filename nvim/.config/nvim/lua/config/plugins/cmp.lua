return {
	"hrsh7th/nvim-cmp",

	priority = 1,

	dependencies = {
		"hrsh7th/cmp-nvim-lsp"
	},

	config = function()
		local cmp = require('cmp')
		cmp.setup({
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
			}),

			mapping = {
				['<Up>'] = cmp.mapping(function(fb)
					if cmp.visible() then cmp.select_prev_item()
					else fb()
					end
				end, { 'i' }),

				['<Down>'] = cmp.mapping(function(fb)
					if cmp.visible() then cmp.select_next_item()
					else fb()
					end
				end, { 'i' }),

				['<CR>'] = cmp.mapping.confirm(),
				['<DEL>'] =  cmp.mapping.close(),
			},
		})
	end
}
