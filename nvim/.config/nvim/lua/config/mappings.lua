local function nmap(key, command, description)
	vim.keymap.set(
		'n',
		'<Leader>' .. key,
		command,
		{
			desc = description
		}
	)
end

local function prefix(p, description)
	local wk = require('which-key')
	wk.register({[p] = { name = description, }}, { prefix = "<leader>", })
end

return {
	n = nmap,
	prefix = prefix,
}
