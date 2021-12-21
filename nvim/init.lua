-- a way for me to set things in certain
-- themes / plugins and have them accessible
-- elsewhere.
--
-- specifically for setting a theme and then
-- setting that in other places that can use it
config_interchange = { }

require 'config.basic'
require 'config.local'
require 'config.neovide'
require 'config.plugins.packer'

-- select color theme
--require 'config.themes.neon'
--require 'config.themes.catppuccin'
-- require 'config.themes.sonokai'
require 'config.themes.dracula'

-- setup plugins
require 'config.plugins.lualine'
require 'config.plugins.nvimtree'
require 'config.plugins.coc'
require 'config.plugins.fzf'
require 'config.plugins.tagbar'
