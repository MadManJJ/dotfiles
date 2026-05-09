return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master", -- add this line to use the legacy version
	build = ":tsupdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = { "lua", "go", "gomod" },
			auto_install = false,
		})
	end,
}
