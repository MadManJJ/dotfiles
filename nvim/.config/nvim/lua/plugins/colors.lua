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
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1, -- 1: Relative path, 2: Absolute path, 4: Filename + parent dir
					},
				},
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
	{
		"kdheepak/monochrome.nvim",
	},
	{
		"aliqyan-21/darkvoid.nvim",
	},
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000, -- Load the colorscheme before other plugins
		config = function()
			-- Enable transparency:
			-- 1 = Standard transparent background
			-- 2 = Extra transparency (includes floating windows/more UI components)
			vim.g.gruvbox_material_transparent_background = 1

			-- Optional contrast preset: "hard", "medium" (default), or "soft"
			vim.g.gruvbox_material_background = "medium"

			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
