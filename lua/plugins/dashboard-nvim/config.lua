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
                    desc = ' Sessions',
                    group = 'HardHackerGreen',
                    action = 'SessionManager load_session',
                    key = require('custom_keys').switch_session,
                },
                {
                    desc = '󰚰 Update',
                    group = 'HardHackerPurple',
                    action = 'Lazy update',
                    key = 'U' 
                },
                {
                    desc = ' Setup',
                    group = 'HardHackerCyan',
                    action = 'e ~/.config/nvim/init.lua',
                    key = 'S',
                },
            },
            footer = require('custom_opts').home_footer,
        },
    }

    vim.cmd([[
    hi! link DashboardHeader    HardHackerRed
    hi! link DashboardFooter    HardHackerComment
    hi! link DashboardMruTitle  Title
    " DashboardProjectTitle
    ]])
end
