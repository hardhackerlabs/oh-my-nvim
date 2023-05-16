return {
    {
        'hardhackerlabs/theme-vim',  
        name = 'hardhacker', 
        config = function() vim.cmd('colorscheme hardhacker') end,
        priority = 1000,
    },
}
