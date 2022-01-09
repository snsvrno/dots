local catppuccin = require("catppuccin")

catppuccin.setup {
	integration = {
		nvimtree = {
			show_root = true,
			enabled = true,
		},
	}
}

vim.cmd[[colorscheme catppuccin]]
