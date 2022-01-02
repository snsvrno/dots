#!/bin/sh

function exists() {
	APP=$1
	if [[ ! -x "$(command -v $APP)" ]]; then
		echo $APP is not installed, skipping ...
		return 1;
	else
		return 0;
	fi
}

# link [SOURCE FILE] [DESTINATION FILE]
#
# hard links the 2 files.
# if the destination already exists it
# checks if it is a link, if it is it
# assumes it is O.K.
function link() {
	SRC=$1
	DEST=$2
	if [[ -f $DEST ]]; then
		if [[ "$(stat -c %h -- "$DEST")" -eq 1 ]]; then
			echo "$DEST exists and is not linked ..";
		fi
	else
		echo "Linking $SRC"
		ln $SRC $DEST
	fi
}

function softlink() {
	SRC=$1
	DEST=$2
	if [[ ! -d $DEST ]]; then
		echo linking $SRC
		ln -s "$(readlink -f $SRC)" "$(readlink -f $DEST)"
	fi
}

# gitclone [REPOSITORYLINK] [DESTINATION FOLDER]
#
# clones a direction, if the folder already exists
# checks that it is a git repository and then 
# updates its.
function gitclone() {
	SRC=$1
	DEST=$2
	if [[ ! -d "$DEST" ]]; then
		git clone $SRC $DEST
	else
		if [[ -d "$DEST/.git" ]]; then
			git --git-dir $DEST/.git update
		else
			echo $DEST is not a git repo
		fi
	fi
}


