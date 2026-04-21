require("config.options")
require("config.keybinds")
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.cmd([[colorscheme oldschool]])
vim.opt.fileformats = { "unix", "dos" }
vim.opt_global.fileformat = "unix"
vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", opts)
vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", opts)
