return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-v>"] = function()
							local text = vim.fn.getreg("+"):gsub("\n", "")
							vim.api.nvim_put({ text }, "c", true, true)
						end,
					},
				},
			},
			pickers = {
				find_files = {},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", function()
			builtin.buffers({
				initial_mode = "normal",
			})
		end, { desc = "Telescope buffers (Normal Mode)" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

		-- File Diagnostics (Bigger window, wrapped text)
		vim.keymap.set("n", "<leader>fd", function()
			require("telescope.builtin").diagnostics({
				bufnr = 0,
				layout_strategy = "horizontal",
				layout_config = { width = 0.9, height = 0.9 }, -- Takes up 90% of the screen
				wrap_results = true, -- Wraps text to the next line
				line_width = "full", -- Prevents Telescope from cutting off the string
			})
		end, { desc = "File Diagnostics" })

		-- Workspace Diagnostics (Bigger window, wrapped text)
		vim.keymap.set("n", "<leader>fD", function()
			require("telescope.builtin").diagnostics({
				layout_strategy = "horizontal",
				layout_config = { width = 0.9, height = 0.9 },
				wrap_results = true,
				line_width = "full",
			})
		end, { desc = "Workspace Diagnostics" })
		vim.keymap.set("n", "gl", function()
			local _, winid = vim.diagnostic.open_float({
				border = "rounded",
				focusable = true,
			})

			if winid then
				vim.api.nvim_set_current_win(winid)
			end
		end, { desc = "Show Line Diagnostics" })
	end,
}
