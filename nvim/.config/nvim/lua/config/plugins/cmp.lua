-- https://github.com/hrsh7th/nvim-cmp

local function config()
	local cmp = require('cmp')

	local settings = {

		snippet = {
			expand = function(args)
				require('snippy').expand_snippet(args.body)
			end
		},

		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

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

	}

	cmp.setup(settings)
end

return {
	'hrsh7th/nvim-cmp',
	priority = 1,
	config = config,
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'dcampos/nvim-snippy',
		'dcampos/cmp-snippy',
	},
}
