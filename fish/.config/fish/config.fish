##############################################
# adds some paths to this session
set fish_function_path ~/.config/fish/user_functions $fish_function_path

# paths and env variables for the various locally managed dev tools
if not test -d $HOME/Dev
	mkdir $HOME/Dev
	touch $HOME/Dev/dev.fish
end
source $HOME/Dev/dev.fish

# local fish file that may have specific things that are local
# to this computer
if not test -e $HOME/.config/fish/local.fish
	touch $HOME/.config/fish/local.fish
end
source $HOME/.config/fish/local.fish

#############################################
# NNN
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui;d:dragdrop'
alias nnn="nnn -r -d -o -i -a"

#############################################
# NVIM
function nvim
	# launches nvim with . if there are no arguements
	# i do this so that it opens on oil.nvim, there is
	# probably a better way to do this.
	if test -n "$argv[1]"
		command nvim $argv
	else
		command nvim
	end
end

##############################################
# fisher setup
set fisher_path ~/.config/fisher
set fish_complete_path $fisher_path/completions
set fish_function_path $fisher_path/functions $fish_function_path
for file in $fisher_path/conf.d/*.fish
    source $file
end

##################################################
# direnv connection
direnv hook fish | source

#################################################
# git stuff
abbr -a -g git " git"
alias gsur="git submodule update --remote"
alias gcm="git commit -m"
alias g-c "git commit"
alias g-p "git push"
alias g-pp "git pull"

###################################################
# customizing colors for hydro prompt
set hydro_color_pwd green
set hydro_color_git yellow
set hydro_color_error magenta

##################################################
# theme stuff
# asking kitty to refresh so that it can reload
# the theme if we change it
command kill -SIGUSR1 $KITTY_PID
# loads the theme from the theme file and sets the
# env variables
set -x THEME $(cat ~/.theme)
source $HOME/.config/fish/user_functions/set_theme.fish
_load_colors $THEME
