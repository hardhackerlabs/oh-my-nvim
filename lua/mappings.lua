vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- Switch Buffer
map('n', '<C-h>', '<C-W>h', opt)
map('n', '<C-j>', '<C-W>j', opt)
map('n', '<C-k>', '<C-W>k', opt)
map('n', '<C-l>', '<C-W>l', opt)

-- bufferline
-- pick a buffer
map('n', '<leader>b', ':BufferLinePick<CR>', opt)

-- nvim-tree
map('n', '<F9>', ':NvimTreeToggle<CR>', opt)

-- floaterm
map('n', '<F12>', ':FloatermToggle<CR>', opt)
map('t', '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', opt)
