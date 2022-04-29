function git-status

	# the watch file.
	set -f git_watch $HOME/.gitwatch

	############################################################
	if test "$argv[1]" = "add"
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

	############################################################
	else if test "$argv[1]" = "-h"; or test "$argv[1]" = "--help"

	############################################################
	else if test "$argv[1]" = "clean"

		if not test -e $git_watch
			echo "no repos found"
			return
		end
		
		set -f repo_list (cat $git_watch)
		rm $git_watch

		for line in $repo_list
			if test -e $line; and test -e $line/.git
				echo "$line" >> $git_watch
			else
				echo removing (set_color -d red)$line (set_color normal)
			end
		end

	############################################################
	else
		# checking the status of each directory in the list file

		# checks options.
		# should we show all paths even if they don't have anything
		# to update?
		set -f opt_show_all false
		if test -n "$argv[1]"; and test "$argv[1]" = "-a"
			set opt_show_all true
		end

		if not test -e $git_watch
			echo "no repos currently watched"
			return
		end

		# sets the ssh-agent so we don't need to get the password a million times.
		set -f garbage (eval (ssh-agent -c))
		command ssh-add -t 2m 2>/dev/null

		set -f repo_list (cat $git_watch)
		for line in $repo_list

			if not test -e $line
				echo (set_color -d red)$line (set_color normal) no longer exists

			else
				command git --git-dir=$line/.git --work-tree=$line fetch >/dev/null 2>/dev/null
				if test $status -ne 0
					echo (set_color -d red)$line(set_color normal) is not a repo
				else
					# echo $line
					set -f git_command for-each-ref --format="%(push:track)" refs/heads
					set -f git_status (git --git-dir=$line/.git --work-tree=$line $git_command)

					if test "$git_status" != " "; and test "$git_status" != ""
						echo (set_color -i blue)$line(set_color normal) (set_color -o yellow)$git_status(set_color normal)
					else if $opt_show_all
						echo (set_color -d)$line(set_color normal)
					end
				end
			end
		end

	############################################################
	end
end
