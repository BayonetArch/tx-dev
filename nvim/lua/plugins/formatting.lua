-- ------FORMATTING SETUP-------------
return {
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					sh = { "shfmt", "lsp", stop_after_first = true },
					javascript = { "prettierd", "lsp", stop_after_first = true },
					javascriptreact = { "prettierd", "lsp", stop_after_first = true },

					html = { "prettierd", "lsp", stop_after_first = true },
					css = { "prettierd", "lsp", stop_after_first = true },

					c = { "clang-format", "lsp", stop_after_first = true },
					go = { "gofmt", "lsp", stop_after_first = true },
					rust = { "rustfmt", "lsp", stop_after_first = true },

					kotlin = { "ktfmt", "lsp", stop_after_first = true },
					lua = { "stylua", "lsp", stop_after_first = true },
					python = { "black", "lsp", stop_after_first = true },
				},
			})
		end,
	},
}
