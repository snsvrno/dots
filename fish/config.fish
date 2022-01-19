# adds some paths to this session
set fish_function_path ~/.config/fish/user_functions $fish_function_path

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# for git & gpg
set -x GPG_TTY (tty)

# for using direnv
direnv hook fish | source
starship init fish | source
