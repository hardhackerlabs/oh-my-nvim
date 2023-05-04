-- Switch Buffer
vim.cmd([[
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
]])

-- nvim-tree
vim.api.nvim_set_keymap('n', '<F9>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
