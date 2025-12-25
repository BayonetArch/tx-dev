-- ----------Collection of short plugins -----------------
return {
	--for auto closing tags
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	--dressing.nvim for menu style type
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		opts = {},
	},
	--color highlighter for highlighting css colors
	{
		"brenoprata10/nvim-highlight-colors",

		event = { "BufReadPre", "BufNewFile" },
		ft = { "jproperties", "conf", "dosini", "css", "html", "javascript", "lua" },
		config = function()
			require("nvim-highlight-colors").setup({
				---Render style
				---@usage 'background'|'foreground'|'virtual'
				render = "virtual",
				virtual_symbol_suffix = " ",

				---@usage 'inline'|'eol'|'eow'
				virtual_symbol_position = "eow",

				---Highlight hex colors, e.g. '#FFFFFF'
				enable_hex = true,

				enable_short_hex = true,

				enable_rgb = true,

				enable_hsl = true,

				enable_ansi = true,
				enable_hsl_without_function = true,

				enable_var_usage = true,

				enable_named_colors = true,

				enable_tailwind = false,

				custom_colors = {
					{ label = "%-%-theme%-primary%-color", color = "#0f1219" },
					{ label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
				},

				exclude_filetypes = {},
				exclude_buftypes = {},
				exclude_buffer = function(bufnr) end,
			})
		end,
	},
	--Undo tree for undo history
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo Tree" },
		},
	},

	--Harpoon
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	--Surround plugin for adding , deleting and replacing surrounds

	{
		"kylechui/nvim-surround",

		event = "VeryLazy",
		config = true,
		-- ========================================
		-- NVIM-SURROUND KEYBINDS REFERENCE
		-- ========================================
		-- ADD SURROUNDS (ys)
		-- Pattern: ys{motion}{char}
		-- example :
		-- ysiw"     - Surround inner word with double quotes

		-- DELETE SURROUNDS (ds)
		-- Pattern: ds{char}
		-- example :
		-- ds"       - Delete surrounding double quotes

		-- CHANGE SURROUNDS (cs)
		-- Pattern: cs{target}{replacement}
		-- examples :
		-- cs"'      - Change double quotes to single quotes
		-- cs'<q>    - Change single quotes to HTML <q> tags

		-- ==========================================
		-- VISUAL MODE
		-- ==========================================

		-- S{char}   - In visual mode, surround selection with character
		-- Examples:
		-- 1. Select text in visual mode
		-- 2. Press S"  - Wrap selection with double quotes
		-- 3. Press S)  - Wrap selection with parentheses

		-- ==========================================
		-- HTML/XML TAGS
		-- ==========================================

		-- ysiwt     - Surround with HTML tag (prompts for tag name)
		-- cst"      - Change any HTML tag to quotes
		-- dst       - Delete surrounding HTML tag
		-- cst<div>  - Change current tag to <div>
		-- ==========================================
		-- FUNCTION CALLS
		-- ==========================================

		-- ysiwf     - Surround with function call (prompts for function name)
		-- dsf       - Delete surrounding function call
		-- csf       - Change function name (prompts for new name)

		-- ==========================================
		-- COMMON TEXT OBJECTS TO USE WITH SURROUNDS
		-- ==========================================

		-- iw        - inner word
		-- aw        - a word (including surrounding whitespace)
		-- ip        - inner paragraph
		-- ap        - a paragraph
		-- it        - inner tag
		-- at        - a tag
		-- i"        - inside double quotes
		-- a"        - around double quotes (includes quotes)
		-- i'        - inside single quotes
		-- a'        - around single quotes (includes quotes)
		-- i)        - inside parentheses
		-- a)        - around parentheses (includes parentheses)

		-- ==========================================
		-- PRACTICAL EXAMPLES
		-- ==========================================

		-- Example 1: Word manipulation
		-- Original: hello
		-- ysiw"  -> "hello"
		-- cs"'   -> 'hello'
		-- ds'    -> hello

		-- Example 2: Function calls
		-- Original: myFunction
		-- ysiwf  -> myFunction() (prompts for function name)
		-- dsf    -> myFunction (removes function call)

		-- Example 3: HTML tags
		-- Original: content
		-- ysiwt  -> <tag>content</tag> (prompts for tag name)
		-- cst<p> -> <p>content</p>
		-- dst    -> content

		-- Example 4: Line operations
		-- Original: This is a line
		-- yss"   -> "This is a line"
		-- cs"[   -> [This is a line]
		-- ds[    -> This is a line
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{

		"udalov/kotlin-vim",
		ft = "kotlin",
	},
}
