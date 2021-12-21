vim.cmd[[nmap <F8> :TagbarToggle<CR>]]

-- haxe support.
vim.g.tagbar_type_haxe = {
	ctagstype = "haxe",
	kinds = {
		"i:interfaces:1:1",
		"t:typedefs:1:1",
		"e:enums:1:1",
		"m:methods:1:1",
		"c:classes:1:1",
		"v:variables:1:1",
	},
	sro = ".",
	kind2scope = {
		e = "enum",
		c = "class",
		m = "method",
		i = "interface",
	},
	scope2kind = {
		enum = "e",
		interface = "i",
		class = "c",
		method = "m",
	}
}
