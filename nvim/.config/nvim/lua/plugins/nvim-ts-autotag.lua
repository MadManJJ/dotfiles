return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename paired tags
				enable_close_on_slash = true, -- Auto close on trailing </
			},
		})
	end,
}
