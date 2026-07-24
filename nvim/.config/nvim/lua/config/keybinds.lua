vim.g.mapleader = " "
vim.keymap.set("n", "<Leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<c-z>", "<nop>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { noremap = true })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
vim.keymap.set("n", "<Leader>tv", ":botright vnew | term<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic list. Quickfix" })
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format file" })
-- vim.keymap.set("n", "<Leader>ve", ":botright vnew | Telescope find_files<CR>")
vim.keymap.set("n", "<Leader>ve", ":botright vnew<CR>")
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "<leader>tc", ":Telescope colorscheme<CR>", { silent = true })

-- Resizing windows with Alt + Arrow Keys
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>")

-- Navigate buffers (VS Code style tab switching)
vim.keymap.set("n", "<Leader>n", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<Leader>p", ":BufferLineCyclePrev<CR>")

-- Close current buffer (Close tab)
vim.keymap.set("n", "<Leader>x", ":bdelete<CR>")

-- Indentation
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
