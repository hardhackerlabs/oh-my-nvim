local keys = require("custom_keys")
local opts = require("custom_opts")

local map = vim.keymap.set
local option = {noremap = true, silent = true }

map('n', keys.jump_left_window, '<C-W>h', option)
map('n', keys.jump_down_window, '<C-W>j', option)
map('n', keys.jump_up_window, '<C-W>k', option)
map('n', keys.jump_right_window, '<C-W>l', option)

-- Supported by bufferline
map('n', keys.pick_tab, ':BufferLinePick<CR>', option)

-- Supported by nvim-tree
map('n', keys.file_explorer, ':NvimTreeToggle<CR>', option)

-- Supported by floaterm
if (opts.terminal_style == "float")
then 

elseif (opts.terminal_style == "bottom")
then
    -- vim.cmd('FloatermNew --silent --height=0.5 --wintype=split --name=default --position=botright')
else

end

map('n', keys.terminal, ':FloatermToggle<CR>', option)
map('t', keys.terminal, '<C-\\><C-n>:FloatermToggle<CR>', option)


-- Supported by diffview
map('n', keys.diff_open, ':DiffviewOpen<CR>', option)
map('n', keys.diff_close, ':DiffviewClose<CR>', option)

