function dots -d "Configuration management git repository"
	git --git-dir=$HOME/.dots/ --work-tree=$HOME $argv
end
