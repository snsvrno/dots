function get-haxe -d "Installs haxe locally"

	set --local api "https://api.github.com/repos/HaxeFoundation/haxe/releases"

	# sets the given arguement for the version, if there isn't given
	# then we will consult the API to see what the latest version is.
	set --local requested_version $argv[1]
	if not test $argv[1]
		set --local content (command curl $api 2>/dev/null)
		set requested_version (command echo $content | jq '.[0].name' -r)
	end

	# setup the local folder, and then check if it exists
	set --local local_folder ".haxe/$requested_version"
	if test -e $local_folder
		echo "haxe $requested_version already installed in $local_folder"
		return
	end

	echo "installing haxe $requested_version locally"

	set --local haxe_name "haxe-$requested_version-linux64"
	set --local haxe_path "https://github.com/HaxeFoundation/haxe/releases/download/$requested_version/$haxe_name.tar.gz"

	command wget $haxe_path 2>/dev/null
	command mkdir -p $local_folder
	command tar -xvf $haxe_name.tar.gz > /dev/null 2>&1

	# because the folder name doesn't match the archive name.
	set --local extracted_name (command ls | grep haxe)

	mv $extracted_name/* $local_folder/
	rm $haxe_name.tar.gz
	rm -fR $extracted_name

	command echo $requested_version > .haxe/version
	direnv-add PATH_add ".haxe/\$(cat .haxe/version)"

	get-neko
end
