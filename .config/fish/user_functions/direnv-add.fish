function direnv-add -d "Adds the content to the .envrc file, if not already in file"
	if test "$argv"
		set --local add 1

		if test -f .envrc
			for line in (cat .envrc)
				if test $line = "$argv"
					set add 0
				end
			end
		end
		
		if test $add = 1
			echo $argv >> .envrc
		end
	end
end
