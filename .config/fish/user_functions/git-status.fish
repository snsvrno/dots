function git-status
	set -f git_watch $HOME/.gitwatch
	set -f opp "read"

	if test -n "$argv[1]"
		set opp $argv[1]
	end

	if test $opp = "add"
		set -f arguement_path "."
		if test -n "$argv[2]"
			set arguement_path $argv[2]
		end

		set -f repo_path (realpath $arguement_path)

		set -f git_watch_contents
		if test -e $git_watch
			set git_watch_contents (cat $git_watch)
		end

		if contains $repo_path $git_watch_contents
			echo "'$repo_path' is already being watched"
			# we don't do anything
		else
			echo "watching '$repo_path'"
			echo $repo_path >> $git_watch
		end

		# sorts the list alphabetically
		command sort $git_watch -o $git_watch

	else
		# we want to check the status of all the repositories and
		# nicely display it to the screen
	
		set -f show_all false
		if test -n "$argv[1]"; and test "$argv[1]" = "-a"
			set show_all true
		end


		if not test -e $git_watch
			echo "no repos found"
			return
		end

		# sets the ssh-agent so we don't need to get the password a million times.
		set -f garbage (eval (ssh-agent -c))
		command ssh-add -t 2m

		set -f repo_list (cat $git_watch)
		for line in $repo_list

			# run the fetch to see if its out of sync
			command git --git-dir=$line/.git --work-tree=$line fetch

			# echo $line
			set -f git_command for-each-ref --format="%(push:track)" refs/heads
			set -f git_status (git --git-dir=$line/.git --work-tree=$line $git_command)

			if test "$git_status" != " "; and test "$git_status" != ""
				echo (set_color -i blue) $line(set_color normal) (set_color -o yellow)$git_status(set_color normal)
			else if $show_all
				echo (set_color -d) $line (set_color normal)
			end

		end

	end

end
