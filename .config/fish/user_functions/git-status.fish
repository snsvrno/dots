function git-status
	set -f git_watch $HOME/.gitwatch
	set -f opp "read"

	if test -n "$argv[1]"
		set opp $argv[1]
	end

	if test $opp = "add"
		set -f repo_path (pwd -P)
		echo adding $repo_path

		set -f git_watch_contents
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

		set -f repo_list (cat $git_watch)
		for line in $repo_list

			# echo $line
			set -f git_command for-each-ref --format="%(push:track)" refs/heads

			set git_status " "
			set -f git_status (git --git-dir=$line/.git --work-tree=$line $git_command)

			if test "$git_status" != " "
				echo (set_color -i blue) $line(set_color normal) (set_color -o yellow)$git_status(set_color normal)
			else
				echo (set_color -d) $line (set_color normal)
			end

		end

	end

end
