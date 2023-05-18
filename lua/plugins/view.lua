return {
    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('plugins/lualine/config')() end,
    },

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function() require('plugins/neo-tree/config')() end,
    }, 

    -- Outline
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function() require('aerial').setup({
            lazy_load = false,
            open_automatic = require('custom_opts').auto_open_outline,
        }) end,
    },

    -- Tab line
    {
        'akinsho/bufferline.nvim', 
        version = "v4.1.0", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            local bufferline = require('bufferline')
            bufferline.setup {
                options = {
                    mode = "buffers", -- set to "tabs" to only show tabpages instead
                    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
                    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                    numbers = function(opts)
                        return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
                    end,
                    indicator = {
                        icon = '▎', -- this should be omitted if indicator style is not 'icon'
                        style = 'icon',
                    },
                    diagnostics = "nvim_lsp",
                    diagnostics_update_in_insert = false,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = require('custom_opts').file_explorer_title,
                            text_align = "left",
                            separator = true,
                        }
                    },
                    color_icons = true, -- whether or not to add the filetype icon highlights
                    separator_style = require('custom_opts').tab_style,
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'},
                    },
                }
            }
        end,
    },

    -- Improve the ui
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
}

