return {
    {
        'glepnir/dashboard-nvim',
        dependencies = {'nvim-tree/nvim-web-devicons', opt = true},
        event = 'VimEnter',
        config = function() require('plugins/dashboard-nvim/config')() end,
    },
}
