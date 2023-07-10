local prefix = "t"

return {
	{
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.1',

		dependencies = {
			'nvim-lua/plenary.nvim',
		},

		config = function()
			local builtin = require('telescope.builtin')

			require('telescope').setup {
				defaults = {
					preview = {
					},
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" },
					path_display = { "truncate" },
					layout_strategy = "horizontal",
					borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
					prompt_prefix = " ",
					sorting_strategy = "ascending",
					dynamic_preview_title = true,
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						}
					}
				},
				extensions = {
					repo = {
						list = {
							search_dirs = {
								"~/Projects",
							}
						}
					}
				}
			}

			require("telescope.previewers").vim_buffer_cat.new = require("telescope.previewers").cat.new

			local m = require('config.mappings')

			m.n(prefix .. '?', builtin.keymaps, "List Keymaps")
			m.n(prefix .. 'h', builtin.live_grep, "Live Grep")
			m.n(prefix .. 'f', builtin.find_files, "Find Files")
			m.n(prefix .. 'b', builtin.buffers, "Buffers")
			m.n(prefix .. 'g', builtin.git_files, "Git Files")

			m.prefix(prefix, "Telescope") 

		end
	},

	{
		'cljoly/telescope-repo.nvim',

		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
		},

		config = function()

			local telescope = require('telescope')
			telescope.load_extension('repo')

			local m = require('config.mappings')
			m.n(prefix .. 'z', telescope.extensions.repo.list, "All Repos")

		end,
	}

}
