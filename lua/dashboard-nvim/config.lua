return function()
    require('dashboard').setup {
        theme = 'hyper',
        shortcut_type = 'number',
        hide = {
            statusline =true, 
            tabline = true,  
            winbar = true,  
        },
        config = {
            header = require('custom_opts').home_header,
            project = { enable = false },
            mru = { limit = 9 },
            shortcut = {
                {
                    desc = ' Update',
                    group = 'HardHackerPurple',
                    action = 'PackerUpdate',
                    key = 'U' 
                },
                {
                    desc = ' Setup',
                    group = 'HardHackerCyan',
                    action = 'e ~/.config/nvim/init.lua',
                    key = 'S',
                },
            },
            footer = require('custom_opts').home_footer,
        },
    }

    vim.cmd([[
    hi! link DashboardHeader  HardHackerRed
    hi! link DashboardFooter  HardHackerGeen
    ]])
end
