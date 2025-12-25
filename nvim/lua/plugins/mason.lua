return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSPs
					"pyright",
					"bash-language-server",
					"css-lsp",
					"emmet-ls",
					"eslint-lsp",
					"html-lsp",
					"neocmakelsp",
					"typescript-language-server",

					-- Formatters
					"prettierd",
					"black",
				},
				auto_update = false,
				run_on_start = true,
			})
		end,
	},
}
