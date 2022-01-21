#!/bin/sh

# the helper functions that are used in this script
source ./functions.sh

#########################################################
## BAT ##################################################
#########################################################
if exists bat; then
	mkdir -p ~/.config/bat
	softlink bat/syntaxes ~/.config/bat/syntaxes
fi

#########################################################
## FISH #################################################
#########################################################
if exists fish; then
	mkdir -p ~/.config/fish
	link fish/config.fish ~/.config/fish/config.fish
	softlink fish/functions ~/.config/fish/user_functions
fi

##########################################################
## GIT ###################################################
##########################################################
if exists git; then
	link git/gitconfig ~/.gitconfig
	link git/gitmessage ~/.gitmessage
fi

#########################################################
## i3 ###################################################
#########################################################
if exists i3; then
	mkdir -p ~/.config/i3
	touch i3wm/local
	link i3wm/config ~/.config/i3/config
	link i3wm/startup ~/.config/i3/startup
	link i3wm/local ~/.config/i3/local
fi

##########################################################
## KITTY TERMINAL ########################################
##########################################################
if exists kitty; then
	mkdir -p ~/.config/kitty
	touch nvim kitty/local.conf
	link kitty/kitty.conf ~/.config/kitty/kitty.conf
	link kitty/theme.conf ~/.config/kitty/theme.conf
	link kitty/local.conf ~/.config/kitty/local.conf
fi

##########################################################
## STARSHIP ##############################################
##########################################################
if exists starship; then
	mkdir ~/.config/starship
	touch starship/local.toml
	link starship/config.toml ~/.config/starship.toml
	link starship/local.toml ~/.config/starship/local.toml
fi

##########################################################
## NEOVIM ################################################
##########################################################
if exists nvim; then
	mkdir -p ~/.config/nvim
	touch nvim/config/local.lua
	link nvim/init.lua ~/.config/nvim/init.lua
	link nvim/plugins.lua ~/.config/nvim/lua/plugins.lua
	softlink nvim/config ~/.config/nvim/lua/config
fi

#########################################################
## picom ################################################
#########################################################
if exists picom; then
	mkdir -p ~/.config/picom
	link picom/picom.conf ~/.config/picom/picom.conf
fi

#########################################################
## polybar ##############################################
#########################################################
if exists polybar; then
	mkdir -p ~/.config/polybar
	link polybar/config ~/.config/polybar/config
	link polybar/launch.sh ~/.config/polybar/launch.sh
	chmod +x polybar/launch.sh
fi

#########################################################
## ranger ###############################################
#########################################################
if exists ranger; then
	mkdir -p ~/.config/ranger
	link ranger/rc.conf ~/.config/ranger/rc.conf
	link ranger/rifle.conf ~/.config/ranger/rifle.conf
fi
