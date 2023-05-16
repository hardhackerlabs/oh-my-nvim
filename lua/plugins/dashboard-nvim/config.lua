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
                    key = 'L',
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
end
