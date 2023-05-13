return {
    {
        'dracula/vim',
        name = 'dracula',
        priority = 1000,
    },
    {
        'hardhackerlabs/theme-vim',  
        name = 'hardhacker', 
        config = function() vim.cmd('colorscheme hardhacker') end,
        priority = 1000,
    },
}
