return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require'telescope'.setup{}

            local option = {noremap = true, silent = true }

            local keys = require("custom_keys")
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', keys.find_files, builtin.find_files, option)
            vim.keymap.set('n', keys.live_grep, builtin.live_grep, option)
            vim.keymap.set('n', keys.search_cursor, builtin.grep_string, option)
            vim.keymap.set('n', keys.find_buffer, builtin.buffers, option)
        end,
    },
}
