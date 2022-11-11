function git-add-r
	git add $argv[2] $(hl bin/tools/runner.hl $argv[1] --skip-run --skip-build --local-files --pipe --quiet)
end
