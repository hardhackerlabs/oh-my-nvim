local keys = require("custom_keys")

local map = vim.keymap.set
local opts = {noremap = true, silent = true }

map('n', keys.jump_left_window, '<C-W>h', opts)
map('n', keys.jump_down_window, '<C-W>j', opts)
map('n', keys.jump_up_window, '<C-W>k', opts)
map('n', keys.jump_right_window, '<C-W>l', opts)

-- Supported by bufferline
map('n', keys.pick_tab, ':BufferLinePick<CR>', opts)

-- Supported by nvim-tree
map('n', keys.file_explorer, ':NvimTreeToggle<CR>', opts)

-- Supported by floaterm
map('n', keys.terminal, ':FloatermToggle<CR>', opts)
map('t', keys.terminal, '<C-\\><C-n>:FloatermToggle<CR>', opts)

-- Supported by telescope
local builtin = require('telescope.builtin')
map('n', keys.find_files, builtin.find_files, opts)
map('n', keys.live_grep, builtin.live_grep, opts)
map('n', keys.search_cursor, builtin.grep_string, opts)
map('n', keys.find_buffer, builtin.buffers, opts)

-- Supported by diffview
map('n', keys.diff_open, ':DiffviewOpen<CR>', opts)
map('n', keys.diff_close, ':DiffviewClose<CR>', opts)

-- Supported by smart-splits
map('n', keys.resize_left, require('smart-splits').resize_left, opts)
map('n', keys.resize_down, require('smart-splits').resize_down, opts)
map('n', keys.resize_up, require('smart-splits').resize_up, opts)
map('n', keys.resize_right, require('smart-splits').resize_right, opts)
