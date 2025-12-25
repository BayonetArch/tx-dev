-- ### ColorSchemes  ###

return {
	-- {
	-- 	"slugbyte/lackluster.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	init = function()
	-- 		vim.cmd.colorscheme("lackluster-mint")
	-- 	end,
	-- },

	-- {
	--     "ramojus/mellifluous.nvim",
	--     config = function()
	--         require("mellifluous").setup({}) -- optional, see configuration section.
	--         vim.cmd("colorscheme mellifluous")
	--         vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--         vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	--         vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	--     end,
	-- }

	-- Configuraion for OldWorld color scheme so that it is not that heavy on the eyes and not too colorful
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oldworld").setup({
				highlight_overrides = {
					Normal = { bg = "#0a0a0a" },
					NormalFloat = { bg = "#0a0a0a" },
					SignColumn = { bg = "#0a0a0a" },

					Macro = { fg = "#8a8a8a" },
					Define = { fg = "#8a8a8a" },
					PreProc = { fg = "#8a8a8a" },
					["@macro"] = { fg = "#8a8a8a" },
					["@constant.macro"] = { fg = "#8a8a8a" },
					["@keyword.directive"] = { fg = "#8a8a8a" },
					["@keyword.directive.define"] = { fg = "#8a8a8a" },

					Type = { fg = "#6ab890" },
					StorageClass = { fg = "#6ab890" }, -- static, register, volatile
					Typedef = { fg = "#6ab890" },
					["@type"] = { fg = "#6ab890" },
					["@type.builtin"] = { fg = "#6ab890" }, -- int, void, char, etc.
					["@type.definition"] = { fg = "#6ab890" },
					["@type.qualifier"] = { fg = "#6ab890" }, -- const, volatile
					["@storageclass"] = { fg = "#6ab890" },
					["@lsp.type.type"] = { fg = "#6ab890" },
					["@lsp.type.class"] = { fg = "#6ab890" },
					["@lsp.type.struct"] = { fg = "#6ab890" },
					["@lsp.type.enum"] = { fg = "#6ab890" },
					["@lsp.type.typeParameter"] = { fg = "#6ab890" },
					Function = { fg = "#d4d4d4" },
					["@function"] = { fg = "#d4d4d4" },
					["@function.call"] = { fg = "#d4d4d4" },
					["@function.macro"] = { fg = "#d4d4d4" },
					["@lsp.type.macro"] = { fg = "#d4d4d4" },
				},
			})

			vim.cmd.colorscheme("oldworld")
		end,
	},
}
