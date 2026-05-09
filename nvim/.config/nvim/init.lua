require("config.options")
require("config.keybinds")
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.cmd([[colorscheme oxocarbon]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.opt.fileformats = { "unix", "dos" }
vim.opt_global.fileformat = "unix"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })

vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", opts)
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", opts)

vim.keymap.set("i", "<C-o>", "<Plug>(emmet-expand-abbr)", { silent = true })
