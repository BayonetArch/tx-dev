-- LSP SETUP
return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "folke/lazydev.nvim" },

		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local bufnr = ev.buf

					-- Keymaps
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "References" })
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })

					-- Auto format on save
					-- local ft = vim.bo[bufnr].filetype
					-- if client:supports_method('textDocument/formatting') then
					-- 	vim.api.nvim_create_autocmd('BufWritePre', {
					-- 		buffer = bufnr,
					-- 		callback = function()
					-- 			vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
					-- 		end,
					-- 	})
					-- end
				end,
			})

			-- Configure each language server
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							checkThirdParty = false,
							maxPreload = 1000,
							preloadFileSize = 50000,
						},
					},
				},
			})

			vim.lsp.config("gopls", {})

			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							buildScripts = {
								enable = false,
							},
						},
						procMacro = {
							enable = true,
						},
					},
				},
			})

			vim.lsp.config("emmet_ls", {
				filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "svelte" },
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
			})

			vim.lsp.config("eslint", {})
			vim.lsp.config("cssls", {})
			vim.lsp.config("clangd", {})
			vim.lsp.config("ts_ls", {})
			vim.lsp.config("pyright", {})
			vim.lsp.config("bashls", {})
			vim.lsp.config("html", {})
			vim.lsp.config("neocmake", {})
			vim.lsp.config("gradle_ls", {})

			vim.lsp.config("kotlin_language_server", {
				cmd = { "kotlin-language-server" },
				-- filetypes = { "kotlin" },
				root_markers = {
					"settings.gradle",
					"settings.gradle.kts",
					"build.gradle",
					"build.gradle.kts",
				},
				init_options = {
					storagePath = vim.fn.stdpath("cache") .. "/kotlin_language_server",
				},
				settings = {
					kotlin = {
						compiler = {
							jvm = {
								target = "1.8",
							},
						},
					},
				},
			})

			-- Enable lsp servers
			vim.lsp.enable({
				"lua_ls",
				"gopls",
				"rust_analyzer",
				"emmet_ls",
				"eslint",
				"cssls",
				"clangd",
				"ts_ls",
				"pyright",
				"bashls",
				"html",
				"neocmake",
				"gradle_ls",
				"kotlin_language_server",
			})
		end,
	},
}
