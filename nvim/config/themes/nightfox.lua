local nightfox = require('nightfox')

nightfox.setup {
	fox = 'duskfox',

	styles = {
		comments = "italic",
		keywords = "bold",
		functions = "italic,bold",
		strings = "italic",
		-- variables = "underline",
	},

	inverse = {
		match_paren = true,
	}
}

nightfox.load()
