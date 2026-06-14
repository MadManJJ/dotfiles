return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	event = { "BufReadPost", "BufNewFile" },

	config = function()
		local status_ok, ts = pcall(require, "nvim-treesitter")
		if not status_ok then
			return
		end

		ts.setup({
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			ensure_installed = { "lua", "go", "gomod", "markdown", "markdown_inline", "typescript", "tsx", "python" },
			auto_install = false,
		})
	end,
}
