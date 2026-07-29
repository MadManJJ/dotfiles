return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			-- This makes sure it doesn't auto-pair if you are typing next to a word
			check_ts = true,
		})
	end,
}
