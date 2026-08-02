return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
				float = {
					-- Padding around the floating window
					padding = 2,

					-- Set the max dimensions.
					-- Can be integers (number of columns/lines) or floats (0.1 to 1.0 for percentage of screen)
					max_width = 0.8, -- 80% of the screen width
					max_height = 0.8, -- 80% of the screen height

					-- Border style. Options: "single", "double", "rounded", "solid", "shadow", or nil
					border = "single",

					win_options = {
						-- Transparency of the floating window (0 is fully opaque, 100 is fully transparent)
						winblend = 10,
					},

					-- Where the preview window opens when you trigger it in float mode
					preview_split = "right",

					-- Optional: override standard window configs
					override = function(conf)
						return conf
					end,
				},
			})

			-- Open parent directory in current window
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

			-- Open parent directory in floating window
			vim.keymap.set("n", "<Leader>-", require("oil").toggle_float)
		end,
	},
}
