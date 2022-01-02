-- a way for me to set things in certain
-- themes / plugins and have them accessible
-- elsewhere.
--
-- specifically for setting a theme and then
-- setting that in other places that can use it
config_interchange = { }

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
require 'config.themes.tokyonight'

-- interface stuff
require 'config.plugins.lualine'
require 'config.plugins.nvimtree'

-- other plugins
require 'config.plugins.treesitter'
require 'config.plugins.trouble'
require 'config.plugins.coc'
require 'config.plugins.fzf'
