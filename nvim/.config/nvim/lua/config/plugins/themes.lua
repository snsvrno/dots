local themepath = ".config/nvim/lua/config/themes"
local command = "ls -pa " .. os.getenv("HOME") .. "/" .. themepath .. " | grep -v /"

local themes = { }

for dir in io.popen(command):lines() do
	local themeName = string.gmatch(dir, '[A-Za-z\\-]+')()
	themes[#themes+1] = require("config.themes." .. themeName)
end

return themes
