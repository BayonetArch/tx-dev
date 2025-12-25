-- -----------------Better nav with flash.nvim -----------------
return {
	"folke/flash.nvim",
	opts = {},
	keys = {
		-- Flash Jump
		{
			"z",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash Jump",
			nowait = true,
		},

		-- Flash Treesitter (functions, loops, etc.)
		{
			"zt",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
			nowait = true,
		},

		-- Flash Remote (jump across windows)
		{
			"zr",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
			nowait = true,
		},

		-- Flash Treesitter Search
		{
			"zs",
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash Treesitter Search",
		},
	},
}
