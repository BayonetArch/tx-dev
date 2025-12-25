return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({

			defaults = {
				path_display = { "smart" },
				mappings = {

					i = {
						["<A-j>"] = actions.move_selection_next,
						["<A-k>"] = actions.move_selection_previous,
						["<A-m>"] = actions.select_default,
						["<A-i>"] = actions.add_selection,
						["<A-e>"] = actions.close,
					},
				},
			},
			pickers = {
				buffers = {
					previewer = false,
					theme = "dropdown",
					layout_config = { width = 45, height = 10 },
				},

				oldfiles = {
					theme = "ivy",
					layout_config = { height = 0.6 },
				},
				find_files = {
					theme = "ivy",
					previewer = false,
					layout_config = { height = 0.6 },
				},
				live_grep = {
					layout_config = {
						width = 100,
					},
				},
			},
		})
	end,
}
