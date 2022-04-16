function git-status
	set --local git_watch $HOME/.gitwatch
	set --local opp "read"

	if test -n "$argv[1]"
		set opp $argv[1]
	end

	if test $opp = "add"
		set --local repo_path (pwd -P)
		echo adding $repo_path

		set --local git_watch_contents
		if test -e $git_watch
			set git_watch_contents (cat $git_watch)
		end

		if contains $repo_path $git_watch_contents
			echo "contains"
			# we don't do anything
		else
			echo "not contains"
			echo $repo_path >> $git_watch
		end

	else
		# we want to check the status of all the repositories and
		# nicely display it to the screen

		if not test -e $git_watch
			echo "no repos found"
			return
		end

		set --local repo_list (cat $git_watch)
		for line in $repo_list
			# echo $line
			set --local git_command for-each-ref --format="%(push:track)" refs/heads
			set --local git_status (git --git-dir=$line/.git --work-tree=$line $git_command)

			if test -n $git_status
				echo (set_color -i blue) $line (set_color normal) $git_status
			end

		end

		# git --git-dir=$HOME/.dots/ --work-tree=$HOME $argv status

	end


end
