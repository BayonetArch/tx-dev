-- ---------AUTOCOMPLETION---------------------
-- NOTE: disabled for now. Using blink.lua instead.
if true then
	return {}
end

return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-cmdline",
			"neovim/nvim-lspconfig",
			"rafamadriz/friendly-snippets",
			"echasnovski/mini.icons",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#121212", fg = "#c8c8c8" }) -- main menu bg/fg
			vim.api.nvim_set_hl(0, "CmpSelection", { bg = "#1a1a1a", fg = "#ffffff", bold = true }) -- selection
			vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#121212", fg = "#a0a0a0" }) -- docs
			vim.api.nvim_set_hl(0, "CmpBorder", { bg = "#121212", fg = "#121212" }) -- invisible border
			vim.api.nvim_set_hl(0, "CmpDocBorder", { bg = "#121212", fg = "#121212" }) -- invisible doc border
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				view = {
					entries = { name = "custom", selection_order = "top_down" },
				},
				performance = {
					max_view_entries = 15,
				},
				window = {
					completion = cmp.config.window.bordered({
						border = "none",
						winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSelection,Search:None",
						scrollbar = false,
					}),
					documentation = cmp.config.window.bordered({
						border = "none",
						winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
						scrollbar = false,
					}),
				},
				formatting = {
					fields = { "abbr", "menu" },

					format = function(entry, vim_item)
						if #vim_item.abbr > 40 then
							vim_item.abbr = string.sub(vim_item.abbr, 1, 37) .. "..."
						end

						vim_item.menu = ({
							nvim_lsp = " LSP", -- simple gear (less flashy)
							luasnip = " Snip",
							buffer = " Buf", -- simple list icon, calmer than before
							path = " Path",
							["css-variables"] = " CSS",
							cmdline = " CMD",
						})[entry.source.name]

						return vim_item
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<M-b>"] = cmp.mapping.scroll_docs(-4),
					["<M-f>"] = cmp.mapping.scroll_docs(4),
					["<M-c>"] = cmp.mapping.complete(),
					["<M-e>"] = cmp.mapping.abort(),
					["<M-y>"] = cmp.mapping.confirm({ select = true }),
					["<M-i>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp", priority = 100 },
					{ name = "luasnip", priority = 90 },
					{ name = "css-variables", priority = 80 },
					{ name = "path", priority = 70 },
				}, {
					{ name = "buffer", keyword_length = 2, priority = 50 },
				}),
				completion = {
					keyword_length = 2,
					autocomplete = { cmp.TriggerEvent.TextChanged },
				},
				experimental = {
					ghost_text = false,
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer", keyword_length = 2, priority = 50 },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline", keyword_length = 2, priority = 50 },
				}),
			})
		end,
	},
}
