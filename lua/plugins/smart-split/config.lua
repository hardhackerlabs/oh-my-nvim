return function()
    local keys = require("custom_keys")

    local opttion = {noremap = true, silent = true }

    vim.keymap.set({'n', 't'}, keys.resize_left, require('smart-splits').resize_left, option)
    vim.keymap.set({'n', 't'}, keys.resize_down, require('smart-splits').resize_down, option)
    vim.keymap.set({'n', 't'}, keys.resize_up, require('smart-splits').resize_up, option)
    vim.keymap.set({'n', 't'}, keys.resize_right, require('smart-splits').resize_right, option)
end
