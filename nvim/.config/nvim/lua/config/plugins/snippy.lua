local snippy_settings = {
	mappings = {
		is = {
			['<Tab>'] = 'expand_or_advance',
			['<S-Tab>'] = 'previous',
		},
		nx = {
			['<leader>x'] = 'cut_text',
		},
	},
}

local function config()
	require('snippy').setup(snippy_settings)
end

return {
	{
		'dcampos/nvim-snippy',
		config = config,
	},
	'dcampos/cmp-snippy'
}
