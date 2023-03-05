local opts = { noremap=true, silent=true }

vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

vim.keymap.set("n", "<Leader>}", ":bnext<CR>", opts)
vim.keymap.set("n", "<Leader>{", ":bprevious<CR>", opts)

vim.keymap.set('n', '<Leader>f', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

