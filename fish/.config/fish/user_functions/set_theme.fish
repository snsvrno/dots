function set_theme -a theme
	command echo $theme > $HOME/.theme
	_load_colors $theme
	_make_i3_theme
	echo "set theme to $theme"
end

function _load_colors -a theme
	set -l raw (cat $HOME/.themes/$theme)

	for line in $raw
		set -l sp (string split " " $line)
		set -g COLOR_$sp[1] $sp[2]
		set -x COLOR_$sp[1] $sp[2]
		export COLOR_$sp[1]=$sp[2]
	end

end

function _make_i3_theme
	set -l theme_file $HOME/.config/i3/theme

	echo "bar {" > $theme_file
  echo "  status_command i3blocks" >> $theme_file
	echo "  colors {" >> $theme_file
	echo "    background $COLOR_black" >> $theme_file
	echo "    statusline $COLOR_black" >> $theme_file
	echo "    separator  $COLOR_black" >> $theme_file
	echo "    focused_workspace  $COLOR_yellow $COLOR_yellow $COLOR_black" >> $theme_file
	echo "    active_workspace   $COLOR_magenta $COLOR_magenta $COLOR_black" >> $theme_file
	echo "    inactive_workspace $COLOR_black $COLOR_black $COLOR_yellow" >> $theme_file
	echo "    urgent_workspace   $COLOR_bright_red $COLOR_bright_red $COLOR_black" >> $theme_file
	echo "    binding_mode       $COLOR_blue $COLOR_blue $COLOR_black" >> $theme_file
	echo "  }" >> $theme_file
	echo "}" >> $theme_file

end
