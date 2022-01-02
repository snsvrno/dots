-- neovim settings, nothing plugin related.
require 'config.basic'

-- this computer specific configurations, not
-- saved in the dotfiles repo.
require 'config.local'

-- settings specifically for using neovide.
require 'config.neovide'

-- loads packer & all the plugins.
require 'config.plugins.packer'

-- the main theme.
require 'config.themes.nightfox'

-- interface stuff
require 'config.plugins.lualine'
require 'config.plugins.nvimtree'

-- other plugins
require 'config.plugins.gitgutter'
require 'config.plugins.treesitter'
require 'config.plugins.trouble'
require 'config.plugins.coc'
require 'config.plugins.fzf'
