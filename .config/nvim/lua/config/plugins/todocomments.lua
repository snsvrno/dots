return function(use) use {

	"folke/todo-comments.nvim",

	requires = {
		"folke/trouble.nvim",
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("todo-comments").setup { }
	end,

} end
