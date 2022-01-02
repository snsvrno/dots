#!/bin/sh

# the helper functions that are used in this script
source ./functions.sh

##########################################################
## KITTY TERMINAL ########################################
##########################################################
if exists kitty; then
	link kitty/kitty.conf ~/.config/kitty/kitty.conf
	link kitty/theme.conf ~/.config/kitty/theme.conf
fi

##########################################################
## NEOVIM ################################################
##########################################################
if exists nvim; then
	link nvim/init.lua ~/.config/nvim/init.lua
	link nvim/plugins.lua ~/.config/nvim/lua/plugins.lua
	softlink nvim/config ~/.config/nvim/lua/config
fi

##########################################################
## GIT ###################################################
##########################################################
if exists git; then
	link git/gitconfig ~/.gitconfig
	link git/gitmessage ~/.gitmessage
fi

#########################################################
## FISH #################################################
#########################################################
if exists fish; then
	link fish/config.fish ~/.config/fish/config.fish
	softlink fish/functions ~/.config/fish/user_functions
fi

#########################################################
## i3 ###################################################
#########################################################
if exists i3; then
	link i3/config ~/.config/i3/config
fi
