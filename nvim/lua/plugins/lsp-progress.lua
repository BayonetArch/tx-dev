-- ----------Lsp progress bar -----------------
return {
	"j-hui/fidget.nvim",

	event = "LspAttach",
	opts = {
		progress = {
			suppress_on_insert = true,
			ignore = {
				lsp = {
					pattern = function(msg)
						return not msg.title:lower():match("workspace")
					end,
				},
			},
		},

		notification = {
			override_vim_notify = false,
			view = {
				stack_upwards = false, -- makes it grow downwards
			},
		},
	},
	config = function(_, opts)
		require("fidget").setup(opts)
	end,
}
