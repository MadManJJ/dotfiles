return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Formatters
				"prettier", -- Primary formatter for JS/TS/HTML/CSS/JSON
				"prettierd", -- Fast daemon version as fallback
				"stylua", -- Lua formatter
				-- Note: gopls is installed via mason-lspconfig
			},
			auto_update = false,
			run_on_start = true,
		})
	end,
}
