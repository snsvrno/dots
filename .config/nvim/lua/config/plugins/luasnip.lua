return function(use) use {

	"L3MON4D3/LuaSnip",

	requires = {
		'saadparwaiz1/cmp_luasnip'
	},

	config = function()

		local setup = {
			history = true,
			updateevents = "TextChanged,TextChangedI",
			enable_autosnippets = true,
		}

		require("luasnip").config.set_config(setup)

		vim.cmd [[imap <silent> <c-l> <cmd> lua local ls = require ('luasnip'); if ls.expand_or_jumpable() then ls.expand_or_jump() end <Cr>]]
		vim.cmd [[imap <silent> <c-h> <cmd> lua local ls = require ('luasnip'); if ls.jumpable(-1) then ls.jump(-1) end <Cr>]]
		vim.cmd [[imap <silent> <c-j> <cmd> lua local ls = require('luasnip'); if ls.choice_active() then ls.change_choice(1) end <Cr>]]
		vim.cmd [[imap <silent> <c-k> <cmd> lua local ls = require('luasnip'); if ls.choice_active() then ls.change_choice(-1) end <Cr>]]

	end

} end
