return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = { "gopls", "angularls", "ts_ls", "html", "cssls", "lua_ls", "pyright" },
		})
	end,
}
