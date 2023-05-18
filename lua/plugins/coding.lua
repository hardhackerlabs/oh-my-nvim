return {
    -- auto-tag
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    },

    -- auto-pairs
    {
        "windwp/nvim-autopairs",
        config = function() 
            require('nvim-autopairs').setup({
                enable_check_bracket_line = false,
                ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
            })
        end,
    },

    -- auto completion
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugins/autocmp/config')()
        end
    },
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path' },
    {'hrsh7th/cmp-cmdline'},

    {'onsails/lspkind.nvim'}, -- icons in autocomplete source
}
