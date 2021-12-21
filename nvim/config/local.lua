-- vim.cmd[[cd /home/snsvrno/Projects]]


-- some haxe build stuff

--vim.cmd('command! HaxeBuildAll lua require("functions.hxml").build(require("functions.hxml").all())')
--vim.cmd('command! HaxeBuild lua require("functions.hxml").build({"build.hxml"})')
--vim.cmd('command! HaxeTestEngine lua require("FTerm").scratch { cmd = "haxelib run test-engine" }')

--vim.cmd[[nmap <F5> :HaxeBuild<CR>]]
--vim.cmd[[nmap <F9> :HaxeTestEngine<CR>]]
