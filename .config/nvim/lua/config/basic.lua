vim.opt.list = true					-- enables list characters
vim.opt.showbreak = "<< "		-- line breaks start with ">>"
vim.opt.breakindent = true	-- line break indents
vim.cmd[[set number relativenumber]]
vim.cmd[[set nu rnu]]
--vim.opt.number = "relative"	-- line numbers
--vim.opt.nu = "rnu"
vim.opt.showmatch = true		-- shows matching brackets
vim.opt.mouse = "a"					-- enable mouse functionality
vim.opt.hlsearch = true			-- highlight search results

vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2 				-- the number of spaces a tab displays.
vim.opt.softtabstop = 0
vim.opt.termguicolors = true
vim.opt.scrolloff = 3				-- shows at least xxx lines on the screen at once when scrolling.

vim.cmd[[set clipboard^=unnamed,unnamedplus]]
