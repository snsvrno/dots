return function(use)

	-------------------------------------
	-- THEMES ---------------------------
	-------------------------------------

	use 'sainnhe/sonokai'
	use 'Mofiqul/dracula.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'rebelot/kanagawa.nvim'
	use { 'catppuccin/nvim', as = "catppuccin" }
	use 'katawful/kat.vim'
	use 'drewtempelmeyer/palenight.vim'
	use 'savq/melange'

	------------------------------------
	-- UI COMPONENTS -------------------
	------------------------------------

	-- git gutter symbols
	use 'airblade/vim-gitgutter'

	-- the bar at the bottom
	use { 'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		}
	}

	-- the side bar navigation tree
	use { 'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons', 
		config = function() require('nvim-tree').setup { } end 
	}

	-- for the trouble split, that shows all problems in the file
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

	------------------------------------------
	-- OTHER STUFF ---------------------------
	------------------------------------------

	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/popup.nvim'
	use "nvim-lua/plenary.nvim"
	use "nvim-telescope/telescope.nvim"
	use 'ggandor/lightspeed.nvim'
	use 'tpope/vim-repeat'

	-- so i can get a matching kitty config if there
	-- isn't one made already.
	use 'psliwka/termcolors.nvim'

	-- for better highlighting.
	use { 'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'folke/todo-comments.nvim'

	-- fuzzy finder.
	-- use 'junegunn/fzf'
	-- use 'junegunn/fzf.vim'

-- language stuff
	use { 'neoclide/coc.nvim', branch = "release" }

	use 'sheerun/vim-polyglot'
	use 'jdonaldson/vaxe'

	-- will run an install request if this was the first time
	-- packer was run.
	if packer_bootstrap then require('packer').sync() end
end
