return {
    {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.9
            vim.g.floaterm_position = 'bottom'
            vim.cmd([[
            hi! link FloatermBorder Comment
            ]])
        end
    },
}
