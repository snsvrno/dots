return {
	"NTBBloodbath/galaxyline.nvim",
	config = function()
		local gl = require('galaxyline')
		local condition = require('galaxyline.condition')
		local gls = gl.section

		local colors = require('dracula').colors()

		local colorGroups = {
			git = { colors.white, colors.gutter_fg },
			file = { colors.fg, colors.visual },
		}

		local bytemarkers = { {0x7FF,192}, {0xFFFF,224}, {0x1FFFFF,240} }
		function utf8(decimal)
			if decimal<128 then return string.char(decimal) end
			local charbytes = {}
			for bytes,vals in ipairs(bytemarkers) do
				if decimal<=vals[1] then
					for b=bytes+1,2,-1 do
						local mod = decimal%64
						decimal = (decimal-mod)/64
						charbytes[b] = string.char(128+mod)
					end
					charbytes[1] = string.char(vals[2]+decimal)
					break
				end
			end
			return table.concat(charbytes)
		end

		local function colormode(mode, shouldFlip)
			local mode = vim.fn.mode()
			local color = { colors.black, colors.gutter_fg }

			if mode:sub(1,1) == "i" then color = { colors.black, colors.orange, "bold" }
			elseif mode:sub(1,1) == "n" then color = { colors.black, colors.purple, "bold" }
			elseif mode:sub(1,1) == "v" then color = { colors.black, colors.cyan, "bold" }
			elseif mode:sub(1,1) == "V" then color = { colors.cyan, colors.black, "bold" }
			elseif mode:sub(1,1) == "c" then color = { colors.black, colors.pink, "bold" }
			end

			if shouldFlip == true then
				local t = color[1]
				color[1] = color[2]
				color[2] = t
			end

			local cmd = "hi GalaxyMode guifg=".. color[1] .. " guibg=" .. color[2]
			if (color[3] ~= nil) then cmd = cmd .. " gui=" .. color[3] end
			vim.api.nvim_command(cmd)
			vim.api.nvim_command("hi GalaxyModeInv guifg=".. color[2])
		end

		local function add(side, name, item)
			gls[side][#gls[side]+1] = { [name] = item }
		end


		----------------------------------------------------------------------------

		local function makeFileInfo(side)
			add(side, "FileIconLeft", {
				condition = condition.buffer_not_empty,
				provider = function() return " " end,
				highlight = colorGroups.file
			})

			add(side, "FileIcon", {
				-- 
				condition = condition.buffer_not_empty,
				provider = "FileIcon",
				highlight = colorGroups.file
			})

			add(side, "FileName", {
				condition = condition.buffer_not_empty,
				provider = "FileName",
				highlight = colorGroups.file
			})

		end

		local function makeMode(side)
			add(side, "ModeLeft", {
				provider = function() return " " end,
				highlight = "GalaxyMode"
			})

			add(side, "Mode", {
				provider = function()
					local mode = vim.fn.mode()
					colormode()
					return mode
				end,
			})

			add(side, "ModeRight", {
				provider = function() return " " end,
				highlight = "GalaxyMode"
			})
		end

		local function makeGit(side)

			add(side, "GitBranchLeft", {
				provider = function() return " " end,
				highlight = colorGroups.git,
				condition = condition.check_git_workspace,
			})
			add(side, "GitBranchIcon", {
				provider = function() return " " end,
				highlight = colorGroups.git,
				condition = condition.check_git_workspace,
			})
			add(side, "GitBranch", {
				provider = "GitBranch",
				highlight = colorGroups.git,
				condition = condition.check_git_workspace,
			})
			add(side, "GitBranchRight", {
				provider = function() return " " end,
				highlight = colorGroups.git,
				condition = condition.check_git_workspace,
			})

			add(side, "GitDiffAddIcon", {
				provider = function() return " " end,
				highlight = { colors.green, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})
			add(side, "GitDiffAdd", {
				provider = "DiffAdd",
				highlight = { colors.green, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})
			add(side, "GitDiffAddRight", {
				provider = function() return " " end,
				highlight = { colors.green, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})

			add(side, "GitDiffRemoveIcon", {
				provider = function() return " " end,
				highlight = { colors.pink, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})
			add(side, "GitDiffRemove", {
				provider = "DiffRemove",
				highlight = { colors.pink, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})
			add(side, "GitDiffRemoveRight", {
				provider = function() return " " end,
				highlight = { colors.pink, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})

			add(side, "GitDiffModifiedLeft", {
				provider = function() return " " end,
				highlight = { colors.cyan, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})
			add(side, "GitDiffModifiedIcon", {
				provider = function() return utf8(0xf9c9) end,
				highlight = { colors.cyan, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})
			add(side, "GitDiffModified", {
				provider = "DiffModified",
				highlight = { colors.cyan, colorGroups.git[2] },
				condition = condition.check_git_workspace,
			})

		end

		----------------------------------------------------------------------------

		makeMode("left")
		makeFileInfo("left")
		add("left", "End", {
			provider = function() return "" end,
		})

		----------------------------------------------------------------------------
		makeGit("right")
		add("right", "LineInfo", {
			provider = "LineColumn",
			highlight = { colors.fg, colors.visual },
		})


	end
}
