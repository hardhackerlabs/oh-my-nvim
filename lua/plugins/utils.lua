return {
    {'rcarriga/nvim-notify'},

    -- resize the window
    {
        'mrjones2014/smart-splits.nvim',
        version = 'v1.2.2',
        config = function() require('plugins/smart-split/config')() end
    },

    -- buffer delete
    {'famiu/bufdelete.nvim'}
}
