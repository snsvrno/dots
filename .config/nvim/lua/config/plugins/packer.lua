local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

	use { "wbthomason/packer.nvim" }

	-- loads the other plugins from `lua/plugins.lua`
	local plugins = require('plugins');
	for i,v in ipairs(plugins.themes) do require('config.themes.' .. v)(use) end
	for i,v in ipairs(plugins.plugins) do require('config.plugins.' .. v)(use) end
	for i,v in ipairs(plugins.noconfig) do use(v) end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end

	vim.cmd([[
		augroup packer_user_config
			autocmd!
			autocmd BufWritePost plugins.lua source <afile> | PackerCompile
		augroup end
	]])

end)
