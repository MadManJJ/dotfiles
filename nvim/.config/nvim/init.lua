require("config.options")
require("config.keybinds")
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.cmd([[colorscheme oxocarbon]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = "NONE" })
vim.opt.fileformats = { "unix", "dos" }
vim.opt.termguicolors = true
vim.opt_global.fileformat = "unix"
vim.opt.background = "dark"
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", opts)
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", opts)

-- Delete without copying into default register
-- vim.keymap.set({ "n", "v" }, "d", '"_d', { desc = "Delete without yanking" })
-- vim.keymap.set({ "n", "v" }, "D", '"_D', { desc = "Delete line without yanking" })
-- vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "Change without yanking" })
-- vim.keymap.set({ "n", "v" }, "C", '"_C', { desc = "Change line without yanking" })
vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete single char without yanking" })

vim.keymap.set("i", "<C-o>", "<Plug>(emmet-expand-abbr)", { silent = true })

-- Automatically start Tree-sitter for ANY language that has an installed parser
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "*", -- Matches all files (Go, TypeScript, Python, etc.)
	callback = function(args)
		local bufnr = args.buf
		local ft = vim.bo[bufnr].filetype

		-- Check if a Tree-sitter parser actually exists for this file type
		local has_parser = pcall(vim.treesitter.get_parser, bufnr, ft)

		if has_parser then
			pcall(vim.treesitter.start, bufnr)
		end
	end,
})
