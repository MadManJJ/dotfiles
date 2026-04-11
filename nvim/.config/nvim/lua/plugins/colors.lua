local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
return {
	{
		"folke/tokyonight.nvim",
		config = function()
			enable_transparency()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependecies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				-- Change this from 'tokyonight' to 'auto'
				-- Oxocarbon doesn't have a 'native' lualine theme,
				-- so 'auto' extracts the IBM Carbon colors perfectly.
				theme = "auto",
				component_separators = "",
				section_separators = "",
			},
		},
	},
	{
		"EdenEast/nightfox.nvim",
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
	},
	{
		"L-Colombo/oldschool.nvim",
		config = true,
		opts = {
			dark_green = "#ffffff",
			pink = "#ff82ff",
			medium_green = "#fcfc03",
			bright_green = "#dffc03",
			blue = "#04bcff",
			red = "#04bcff",
		},
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
}
