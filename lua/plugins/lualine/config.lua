return function()
    local colors = {
        red       = '#e965a5',
        green     = '#b1f2a7', 
        yellow    = '#ebde76',
        blue      = '#b1baf4',
        purple    = '#e192ef',
        cyan      = '#b3f4f3',
        white     = '#eee9fc',
        black     = '#282433',
        selection = '#3f3951',
        comment   = '#938aad',
    }

    local hardhacker_theme = {
        normal = {
            a = { fg = colors.black, bg = colors.purple },
            b = { fg = colors.red, bg = colors.selection },
            c = { fg = colors.comment, bg = colors.selection },
        },

        insert = { a = { fg = colors.black, bg = colors.green } },
        visual = { a = { fg = colors.black, bg = colors.yellow } },
        replace = { a = { fg = colors.black, bg = colors.red } },

        inactive = {
            a = { fg = colors.white, bg = colors.selection },
            b = { fg = colors.white, bg = colors.selection },
            c = { fg = colors.white, bg = colors.selection },
        },
    }

    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = hardhacker_theme,
            component_separators = { left = '░', right = '░'},
            section_separators = {},
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
                statusline = 1000,
                tabline = 1000,
                winbar = 1000,
            }
        },
        sections = {
            lualine_a = {'mode' },
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
    }
end
