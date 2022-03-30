return function(use)
	use {

		"L3MON4D3/LuaSnip",

		requires = {
			'saadparwaiz1/cmp_luasnip'
		},

		config = function()
			require("luasnip").config.set_config {
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			}


			--vim.api.nvim_set_keymap("i", "<c-l>", ":lua local ls = require ('luasnip'); if ls.expand_or_jumpable() then ls.expand_or_jump() end<CR>", { silent = true })
			--vim.api.nvim_set_keymap("i", "<c-h>", ":lua local ls = require('luasnip'); if ls.jumpable(-1) then ls.jump(-1) end<CR>", { silent = true })
			--vim.api.nvim_set_keymap("i", "<c-k>", ":lua local ls = require('luasnip'); if ls.choice_active() then ls.change_choice(1) end<CR>", { silent = true })
			--vim.api.nvim_set_keymap("i", "<c-j>", ":lua local ls = require('luasnip'); if ls.choice_active() then ls.change_choice(-1) end<CR>", { silent = true })

			vim.cmd [[imap <silent> <c-l> <cmd> lua local ls = require ('luasnip'); if ls.expand_or_jumpable() then ls.expand_or_jump() end <Cr>]]
			vim.cmd [[imap <silent> <c-h> <cmd> lua local ls = require ('luasnip'); if ls.jumpable(-1) then ls.jump(-1) end <Cr>]]
			--vim.cmd [[inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>]]

			--vim.cmd [[snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>]]
			--vim.cmd [[snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>]]

			--vim.cmd [[imap <silent><expr> <C-Tab> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<Cr>']]
			vim.cmd [[imap <silent> <c-j> <cmd> lua local ls = require('luasnip'); if ls.choice_active() then ls.change_choice(1) end <Cr>]]
			vim.cmd [[imap <silent> <c-k> <cmd> lua local ls = require('luasnip'); if ls.choice_active() then ls.change_choice(-1) end <Cr>]]
		end,

	}
end
