return {
    {'neovim/nvim-lspconfig', config = function() require('plugins/lspconfig/config')() end},
    {
        "williamboman/mason.nvim",
        config = function() 
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    {
        'tami5/lspsaga.nvim',
        config = function()
            require('lspsaga').init_lsp_saga {
                error_sign = '!',
                warn_sign = '^',
                hint_sign = '?',
                infor_sign = '~',
                border_style = "round",
                code_action_prompt = {
                    enable = false
                }
            }
        end
    },
}
