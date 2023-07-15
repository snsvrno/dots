# adds some paths to this session
set fish_function_path ~/.config/fish/user_functions $fish_function_path

source $HOME/Dev/dev.fish
source $HOME/.config/fish/local.fish

# NNN
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui;d:dragdrop'
alias nnn="nnn -r -d -o -i -a"

# NVIM
function nvim
	# launches nvim with . if there are no arguements
	if test -n "$argv[1]"
		command nvim $argv
	else
		command nvim
	end
end

# fisher setup
set fisher_path ~/.config/fisher
set fish_complete_path $fisher_path/completions
set fish_function_path $fisher_path/functions $fish_function_path
for file in $fisher_path/conf.d/*.fish
    source $file
end

# direnv connection
direnv hook fish | source

# git stuff
abbr -a -g git " git"
alias gsur="git submodule update --remote"
alias gcm="git commit -m"
alias g-c "git commit"
alias g-p "git push"
alias g-pp "git pull"

# customizing colors for hydro prompt
set hydro_color_pwd green
set hydro_color_git yellow
set hydro_color_error magenta

# asking kitty to refresh
# set -l pids $(ps ux | grep kitty | awk '{print $2}')
# for id in $pids
# 	command kill -SIGUSR1 $id
# end
command kill -SIGUSR1 $KITTY_PID
