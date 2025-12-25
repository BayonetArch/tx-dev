return {
	"echasnovski/mini.statusline",
	version = "*",
	config = function()
		require("mini.statusline").setup({
			-- Content of statusline as functions which return statusline string
			content = {
				-- Content for active window
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 75 })
					local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })

					-- Combine sections without location info
					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, lsp } },
						"%<", -- Mark general truncate point
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- End left alignment
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
					})
				end,

				-- Content for inactive window
				inactive = function()
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					return MiniStatusline.combine_groups({
						{ hl = "MiniStatuslineFilename", strings = { filename } },
					})
				end,
			},

			use_icons = true,

			-- Whether to set Vim's settings for statusline
			set_vim_settings = true,
		})
	end,
}
