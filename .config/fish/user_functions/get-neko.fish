function get-neko -d "Locally installs neko"

	set --local api "https://api.github.com/repos/HaxeFoundation/neko/releases"

	# sets the given arguement for the version, if there isn't given
	# then we will consult the API to see what the latest version is.
	set --local requested_version $argv[1]
	if not test $argv[1]
		set --local content (command curl $api 2>/dev/null)
		set requested_version (command echo $content | jq '.[0].name' -r)
	end

	set --local local_folder ".neko/$requested_version"
	if test -e $local_folder
		echo "neko v$requested_version already installed in $local_folder"
		return
	end
	echo "installing neko v$requested_version"
	
	set --local neko_name "neko-$requested_version-linux64"
	set --local neko_tag (string replace -r -a \\. \- $requested_version)
	set --local neko_path "https://github.com/HaxeFoundation/neko/releases/download/v$neko_tag/$neko_name.tar.gz"

	command wget $neko_path 2>/dev/null
	command mkdir -p $local_folder
	command tar -xvf $neko_name.tar.gz > /dev/null 2>&1

	mv $neko_name/* $local_folder/
	rm $neko_name.tar.gz
	rm -fR $neko_name

	command echo $argv > .neko/version
	direnv-add PATH_add ".neko/\$(cat .neko/version)"
	direnv-add path_add LD_LIBRARY_PATH".neko/\$(cat .neko/version)"
end
