vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

-- Use 'control + hjkl' shortcut to switch/jump window.
map('n', '<C-h>', '<C-W>h', opt)
map('n', '<C-j>', '<C-W>j', opt)
map('n', '<C-k>', '<C-W>k', opt)
map('n', '<C-l>', '<C-W>l', opt)

-- Use <leader>b shortcut to pick a buffer tab.
-- Supported by bufferline
map('n', '<leader>b', ':BufferLinePick<CR>', opt)

-- Use the F9 shortcut to open or close file explorer.
-- Supported by nvim-tree
map('n', '<F9>', ':NvimTreeToggle<CR>', opt)

-- Use the F12 shortcut to open or close the terminal.
-- Supported by floaterm
map('n', '<F12>', ':FloatermToggle<CR>', opt)
map('t', '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', opt)

-- Use '<leader>ff, fg, fs' shortcut to find and search files.
-- Use the 'control + c' to close telescope window. <C-c> is the default setting.
-- Supported by telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- Use <leader>dv shortcut to open 'git diff'.
-- Use <leader>dc shortcut to close 'git diff'.
map('n', '<leader>dv', ':DiffviewOpen<CR>', opt)
map('n', '<leader>dc', ':DiffviewClose<CR>', opt)
