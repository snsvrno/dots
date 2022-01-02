return function(use)

	use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }

	use 'sheerun/vim-polyglot'
	use 'jdonaldson/vaxe'

	-------------------------------------
	-- THEMES ---------------------------
	use 'folke/tokyonight.nvim'
	use 'rafamadriz/neon'
	use 'catppuccin/nvim'
	use 'sainnhe/sonokai'
	use 'Mofiqul/dracula.nvim'
	use 'floke/tokyonight.nvim'
	use 'EdenEast/nightfox.nvim'


	use 'airblade/vim-gitgutter'

-- 	use { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' }
	
	use { 'kyazdani42/nvim-tree.lua', 
		requires = 'kyazdani42/nvim-web-devicons', 
		config = function() require('nvim-tree').setup { } end 
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use { "folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			}
  	end
	}
	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

-- language stuff
--	use 'neovim/nvim-lspconfig'
	use { 'neoclide/coc.nvim', branch = "release" }

	if packer_bootstrap then require('packer').sync() end
end
