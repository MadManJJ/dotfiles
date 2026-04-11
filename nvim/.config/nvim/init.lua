require("config.options")
require("config.keybinds")
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.cmd([[colorscheme moonfly]])
vim.opt.fileformats = { "unix", "dos" }
vim.opt_global.fileformat = "unix"
vim.opt.termguicolors = true
vim.opt.background = "dark"
