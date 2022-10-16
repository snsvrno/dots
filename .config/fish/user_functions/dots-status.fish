function dots-status -d "Configuration management git repository, lists untracked files"
	git --git-dir=$HOME/.dots/ --work-tree=$HOME status -u .
end
