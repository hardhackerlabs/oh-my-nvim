return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function()
            -- disable netrw at the very start of your init.lua (strongly advised)
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 35,
                },
                renderer = {
                    group_empty = true,
                    highlight_git = true,
                },
                filters = {
                    dotfiles = true,
                },
            })
        end
    },
}
