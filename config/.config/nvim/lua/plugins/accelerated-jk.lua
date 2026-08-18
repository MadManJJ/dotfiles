return {
	"rainbowhxch/accelerated-jk.nvim",
	config = function()
		-- Optional: Customizing the acceleration steps
		require("accelerated-jk").setup({
			mode = "time_driven",
			enable_deceleration = false,
			acceleration_limit = 150,
			-- We start with smaller numbers so the "jump" doesn't feel like a glitch,
			-- but we get to high numbers very quickly.
			acceleration_table = { 2, 4, 8, 8, 16, 18, 25, 35 },
		})
	end,
}
