#!/bin/sh

# the helper functions that are used in this script
source ./functions.sh

##########################################################
## KITTY TERMINAL ########################################
##########################################################
if exists kitty; then
	link kitty/kitty.conf ~/.config/kitty/kitty.conf
	link kitty/theme.conf ~/.config/kitty/theme.conf
	touch nvim kitty/local.conf
	link kitty/local.conf ~/.config/kitty/local.conf
fi

##########################################################
## NEOVIM ################################################
##########################################################
if exists nvim; then
	link nvim/init.lua ~/.config/nvim/init.lua
	link nvim/plugins.lua ~/.config/nvim/lua/plugins.lua
	softlink nvim/config ~/.config/nvim/lua/config
	touch nvim/config/local.lua
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
	link i3wm/config ~/.config/i3/config
	link i3wm/startup ~/.config/i3/startup
	touch i3wm/local
	link i3wm/local ~/.config/i3/local
fi

#########################################################
## polybar ##############################################
#########################################################
if exists polybar; then
	link polybar/config ~/.config/polybar/config
	link polybar/launch.sh ~/.config/polybar/launch.sh
	chmod +x polybar/launch.sh
fi

#########################################################
## picom ################################################
#########################################################
if exists picom; then
	link picom/picom.conf ~/.config/picom/picom.conf
fi
