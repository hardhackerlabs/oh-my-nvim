return {
    {
        "williamboman/mason.nvim",
        config = function() 
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    },
                    border = "rounded",
                }
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                -- ["rust_analyzer"] = function ()
                --     require("rust-tools").setup {}
                -- end
            }
        end,
    },

    {
        'neovim/nvim-lspconfig',
        config = function() require('plugins/lspconfig/config')() end,
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
