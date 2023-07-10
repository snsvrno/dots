local function config()
	local col = require('NeoColumn')
	col.setup()
	col.toggle_neocolumn()
end

return {
	"ecthelionvi/NeoColumn.nvim",
	config = config,
}
