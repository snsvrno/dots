function run
	set --local runit 1
	
		if test $argv = "-b"
			set runit 0
			command haxe build.hxml

			if test $status = 0
				set runit 1
			end
		end

	if test $runit = 1
		hl bin/game.hl
	end
end
