local opts = { noremap=true, silent=true }

-- Copy to clipboard
vim.keymap.set("v", "<D-c>", ":'<,'>w !pbcopy<CR>", opts)

-- Nvim-Tree
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Better window navigation
vim.keymap.set("n", "<Leader>wh", "<C-w>h", opts)
vim.keymap.set("n", "<Leader>wj", "<C-w>j", opts)
vim.keymap.set("n", "<Leader>wk", "<C-w>k", opts)
vim.keymap.set("n", "<Leader>wl", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-j>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-k>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-h>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-w>", ":bdelete<CR>", opts)

-- Swap lines
vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", opts)
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", opts)

-- Telescope
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files <CR>", opts)
vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep <CR>", opts)
vim.keymap.set("n", "<Leader>fb", ":Telescope buffers initial_mode=normal<CR>", opts)
vim.keymap.set("n", "<Leader>fl", ":Telescope flutter commands initial_mode=normal<CR>", opts)
vim.keymap.set("n", "<Leader>fr", ":Telescope lsp_references initial_mode=normal<CR>", opts)
vim.keymap.set("n", "<Leader>fs", ":Telescope lsp_workspace_symbols initial_mode=normal<CR>", opts)

-- Terminal
vim.keymap.set("n", "<Leader>t", ":ToggleTerm direction=float<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<Leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})

