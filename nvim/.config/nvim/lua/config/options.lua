vim.opt.number = true
vim.opt.cursorline = false
vim.opt.shiftwidth = 2

vim.api.nvim_set_hl(0, "CursorLine", {
	cterm = {},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.opt_local.expandtab = false -- Go requires real tabs
		vim.opt_local.tabstop = 8 -- Make the tab LOOK like 4 spaces
		vim.opt_local.shiftwidth = 8 -- Auto-indent by 4 spaces
		vim.opt_local.softtabstop = 8 -- Make Backspace delete 4 spaces worth
	end,
})
