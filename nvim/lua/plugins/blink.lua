-- ### Autocompletion ###
return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*",

	event = "InsertEnter",
	opts = {
		keymap = {
			-- set to 'none' to disable the 'default' preset
			-- preset = "default",

			["<M-p>"] = { "select_prev", "fallback" },
			["<M-y>"] = { "accept", "fallback" },

			["<M-I>"] = { "select_prev", "fallback" },

			["<M-i>"] = { "select_next", "fallback" },
			-- disable a keymap from the preset
			["<C-e>"] = { "hide", "fallback" }, -- or {}
			["<C-k>"] = { "show_signature","hide_signature", "fallback" }, -- or {}

			-- control whether the next command will be run when using a function
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = { documentation = { auto_show = true } },

    signature = { enabled = true},
		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
