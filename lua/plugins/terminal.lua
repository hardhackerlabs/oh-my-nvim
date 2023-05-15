return {
--    {
--        'voldikss/vim-floaterm',
--        config = function()
--            vim.g.floaterm_width = 0.8
--            vim.g.floaterm_height = 0.9
--            vim.g.floaterm_position = 'bottom'
--            vim.cmd([[
--            hi! link FloatermBorder Comment
--            ]])
--        end
--    },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup{
                highlights = {
                    Normal = {
                        link = 'Normal'
                    },
                    NormalFloat = {
                        link = 'Normal'
                    },
                    FloatBorder = {
                        link = 'Comment'
                    },
                },
                direction = require('custom_opts').terminal_style,
                float_opts = {
                    border = 'rounded',
                    winblend = require('custom_opts').terminal_transparency,
                    width = function(term)
                            return 160
                    end,
                    height = 35,
                },
            }
        end,
    },
}
