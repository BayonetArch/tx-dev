--   ----- NOTIFICATION ----------
return {

	"echasnovski/mini.notify",
	version = "*",
	config = function()
		local notify = require("mini.notify")
		notify.setup({
			content = {
				format = nil, -- Use default formatting

				sort = nil, -- Use default sorting (by timestamp)
			},
			lsp_progress = {
				enable = false, -- Disable LSP progress notifications
				duration_last = 1000,
			},

			window = {
				config = {
					border = "rounded",
				},

				-- Maximum window dimensions
				max_width_share = 0.382,
				max_height_share = 0.25,

				winblend = 1, -- No transparency
			},
		})
		vim.notify = notify.make_notify({
			ERROR = { duration = 5000 },
			WARN = { duration = 4000 },
			INFO = { duration = 3000 },
			DEBUG = { duration = 2000 },
			TRACE = { duration = 1000 },
		})
	end,
}
