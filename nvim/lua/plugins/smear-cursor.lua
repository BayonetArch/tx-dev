-- smooth cursor animation.adjust as you like
return {
	"sphamba/smear-cursor.nvim",
	opts = { -- Default  Range
		stiffness = 0.75, -- 0.6      [0, 1]
		trailing_stiffness = 0.48, -- 0.4      [0, 1]
		stiffness_insert_mode = 0.75, -- 0.5      [0, 1]
		trailing_stiffness_insert_mode = 0.48, -- 0.5      [0, 1]
		damping = 0.8, -- 0.65     [0, 1]
		damping_insert_mode = 0.8, -- 0.7      [0, 1]
		time_interval = 12,
		distance_stop_animating = 0.5, -- 0.1      > 0
	},
}
