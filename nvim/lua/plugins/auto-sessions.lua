-- setup auto session for saving session
return {
	"rmagatti/auto-session",

	keys = {
		{
			"<M-s>",
			function()
				require("auto-session").SaveSession()
			end,
			desc = "Save session",
		},
		{
			"<M-r>",
			function()
				require("auto-session").RestoreSession()
			end,
			desc = "Restore session",
		},
	},
-- NOTE: only using the keybindings, not auto saving/restoring sessions
	config = function()
		require("auto-session").setup({
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			auto_save = false, -- disable auto saving of sessions on exit
			auto_restore = false,
		})
	end,
}
