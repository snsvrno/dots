function get-hl -d "Builds a local hashlink"

	set --local requested_version $argv[1]

	if not test -d .hl/git
		set --local repo https://github.com/HaxeFoundation/hashlink.git

		if not test -f .hl; command mkdir .hl; end
		command git clone $repo .hl/git > /dev/null 2>&1
	end

	cd .hl/git
	command git pull > /dev/null 2>&1

	if test -d
		command git checkout $requested_version > /dev/null 2>&1
	else
		command git checkout master /dev/null 2>&1
	end

	echo "building hl $requested_version"
	make > /dev/null 2>&1

	cd ..
	cd ..

	if test -z $requested_version
		set requested_version latest
	end

	if not test -d .hl/$requested_version
		command mkdir .hl/$requested_version
		command mv .hl/git/hl .hl/$requested_version/
		for file in (command ls -1 .hl/git/*.hdll)
			mv $file .hl/$requested_version/
		end
		for file in (command ls -1 .hl/git/*.so)
			mv $file .hl/$requested_version/
		end
	end

	command echo $requested_version > .hl/version
	direnv-add PATH_add ".hl/\$(cat .hl/version)"
	direnv-add path_add LD_LIBRARY_PATH ".hl/\$(cat .hl/version)"

end
