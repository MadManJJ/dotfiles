return {
	{
		"folke/snacks.nvim",
		dependencies = { "MaximilianLloyd/ascii.nvim" },

		opts = function()
			local ascii = require("ascii")

			local my_arts = {
				ascii.art.misc.hydra.hydra,
				ascii.art.misc.krakens.krakedking,
			}

			math.randomseed(os.time()) -- Ensures it's actually random each time you launch
			local random_selection = my_arts[math.random(#my_arts)]

			local my_header = table.concat(random_selection, "\n")

			return {
				dashboard = {
					preset = {
						header = my_header,
					},
				},
			}
		end,
	},
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
