vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

return {
    -- Use 'control + hjkl' shortcut to switch/jump window.
    jump_left_window    = "<C-h>", 
    jump_right_window   = "<C-l>",
    jump_up_window      = "<C-k>",
    jump_down_window    = "<C-j>",

    -- Use '<leader>b' shortcut to pick a buffer tab.
    pick_tab            = "<leader>b", 

    -- Use the 'F9' shortcut to open or close file explorer.
    file_explorer       = "<F9>",

    -- Use the 'F12' shortcut to open or close the terminal.
    terminal            = "<F12>",

    -- Use '<leader>ff, fg, fs' shortcut to find and search files.
    -- Use the 'control + c' to close telescope window. <C-c> is the default setting, can't edit it here.
    find_files          = "<leader>ff",
    live_grep           = "<leader>fg",
    search_cursor       = "<leader>fs",
    find_buffer         = "<leader>fb",
    -- close_telescope  = "<C-c>",

    -- Use '<leader>do' shortcut to open 'git diff'.
    diff_open           = "<leader>do",
    -- Use '<leader>dc' shortcut to close 'git diff'.
    diff_close          = "<leader>dc",

    -- Use 'shift + alt + hjkl' shortcut to resize the window
    resize_left         = "<S-A-h>", 
    resize_down         = "<S-A-j>",
    resize_up           = "<S-A-k>",
    resize_right        = "<S-A-l>",

    -- TODO:
    --goto_back           = "<C-o>",
    goto_definition     = "gd",
    goto_declaration    = "gD",
    goto_impl           = "gi",
    goto_references     = "gr",
    lsp_rename          = "<leader>rn",
}
