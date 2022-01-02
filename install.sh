#!/bin/sh
source ./functions.sh

##########################################################
## KITTY TERMINAL ########################################
##########################################################
link kitty/kitty.conf ~/.config/kitty/kitty.conf
link kitty/theme.conf ~/.config/kitty/theme.conf
# gitclone https://github.com/dexpota/kitty-themes.git ~/.config/kitty/themes  

##########################################################
## NEOVIM ################################################
##########################################################
link nvim/init.lua ~/.config/nvim/init.lua
link nvim/plugins.lua ~/.config/nvim/lua/plugins.lua
softlink nvim/config ~/.config/nvim/lua/config

##########################################################
## GIT ###################################################
##########################################################
link git/gitconfig ~/.gitconfig
link git/gitmessage ~/.gitmessage

#########################################################
## FISH #################################################
#########################################################
link fish/config.fish ~/.config/fish/config.fish
softlink fish/functions ~/.config/fish/user_functions

#########################################################
## i3 ###################################################
#########################################################
link i3/config ~/.config/i3/config
