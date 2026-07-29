return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				-- Use Prettier for TypeScript/JavaScript (prefer prettier, fallback to prettierd)
				javascript = { "prettier", "prettierd", stop_after_first = true },
				typescript = { "prettier", "prettierd", stop_after_first = true },
				javascriptreact = { "prettier", "prettierd", stop_after_first = true },
				typescriptreact = { "prettier", "prettierd", stop_after_first = true },
				html = { "prettier", "prettierd", stop_after_first = true },
				css = { "prettier", "prettierd", stop_after_first = true },
				json = { "prettier", "prettierd", stop_after_first = true },
				-- Let the LSP (gopls) handle Go formatting for maximum speed
				-- go = {}, -- explicitly empty to ensure gopls handles it
				-- Stylua for Lua files
				lua = { "stylua" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback", -- Use LSP (like gopls) if no Conform formatter is defined
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Keep your speed optimization
			capabilities.workspace = { didChangeWatchedFiles = { dynamicRegistration = false } }

			vim.lsp.config("*", { capabilities = capabilities })

			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						gofumpt = true,
						analyses = { unusedparams = true, shadow = true },
					},
				},
			})

			vim.lsp.config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						-- 1. Force this to a boolean to kill the map error
						checkOnSave = true,
						-- 2. Use the new schema for the clippy command
						check = {
							command = "clippy",
						},
						cargo = { allFeatures = true },
						-- 3. Prevent the autocomplete termSearch crash
						completion = {
							termSearch = {
								enable = false,
							},
						},
					},
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" }, -- Neovim uses LuaJIT
						diagnostics = {
							globals = { "vim" }, -- Recognize vim as a valid global
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.enable({ "gopls", "rust_analyzer", "lua_ls", "ts_ls", "angularls", "html", "cssls", "pyright" })

			-- Create buffer-local LSP mappings when a language server attaches
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					local opts = { noremap = true, silent = true, buffer = bufnr }

					-- Prefer LSP definition when LSP is attached
					vim.keymap.set(
						"n",
						"gd",
						vim.lsp.buf.definition,
						vim.tbl_extend("force", opts, { desc = "Go to definition (LSP)" })
					)

					-- Always available: force Vim's normal/tag-based "gd"
					vim.keymap.set("n", "<Leader>gd", function()
						vim.cmd("normal! gd")
					end, vim.tbl_extend("force", opts, { desc = "Go to definition (tags)" }))
				end,
			})
		end,
	},
}
