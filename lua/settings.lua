local keys = require("custom_keys")
local opts = require("custom_opts")

local map = vim.keymap.set
local option = {noremap = true, silent = true }

map('n', keys.jump_left_window, '<C-W>h', option)
map('n', keys.jump_down_window, '<C-W>j', option)
map('n', keys.jump_up_window, '<C-W>k', option)
map('n', keys.jump_right_window, '<C-W>l', option)

-- Supported by bufdelete
vim.cmd([[cnoreabbrev q Bdelete]])

-- Supported by bufferline
map('n', keys.pick_tab, ':BufferLinePick<CR>', option)

-- Supported by nvim-tree
map('n', keys.file_explorer, ':Neotree position=left source=filesystem action=show toggle=true<CR>', option)
map('n', keys.git_status, ':Neotree position=float source=git_status action=show toggle=true<CR>', option)
map('n', keys.code_symbols, ':Neotree position=right source=document_symbols action=focus toggle=true<CR>', option)

-- Supported by diffview
map('n', keys.diff_open, ':DiffviewOpen<CR>', option)
map('n', keys.diff_close, ':DiffviewClose<CR>', option)

-- Supported by floaterm
map('n', keys.terminal, ':FloatermToggle<CR>', option)
map('t', keys.terminal, '<C-\\><C-n>:FloatermToggle<CR>', option)


-- Function to set up the save shortcut
--
local function setup_save_shortcut()
  local is_mac = vim.fn.has("mac") == 1
  local is_linux = vim.fn.has("unix") == 1 and not is_mac
  local is_windows = vim.fn.has("win32") == 1

  -- Define key mappings
  local map = function(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap=true})
  end

  if is_mac then
    map('n', '<D-s>', ':w<CR>')
    map('v', '<D-s>', ':w<CR>')
    map('i', '<D-s>', '<Esc>:w<CR>a')
  elseif is_linux then
    map('n', '<C-s>', ':w<CR>')
    map('v', '<C-s>', ':w<CR>')
    map('i', '<C-s>', '<Esc>:w<CR>a')
  elseif is_windows then
    map('n', '<C-s>', ':w<CR>')
    map('v', '<C-s>', ':w<CR>')
    map('i', '<C-s>', '<Esc>:w<CR>a')
  end
end

setup_save_shortcut()
