-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'
    use 'rcarriga/nvim-notify'

    -- dashboard-nvim
    use {
        'glepnir/dashboard-nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                shortcut_type = 'number',
                hide = {
                    statusline =true,    -- hide statusline default is true
                    tabline = true,       -- hide the tabline
                    winbar = true,        -- hide winbar
                },
                config = {
                    header = {
                        '                                                                                 ',  
                        ' ██╗  ██╗ █████╗ ██████╗ ██████╗ ██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ ',
                        ' ██║  ██║██╔══██╗██╔══██╗██╔══██╗██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗',
                        ' ███████║███████║██████╔╝██║  ██║███████║███████║██║     █████╔╝ █████╗  ██████╔╝',
                        ' ██╔══██║██╔══██║██╔══██╗██║  ██║██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗',
                        ' ██║  ██║██║  ██║██║  ██║██████╔╝██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║',
                        ' ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝',
                        '                                                                                 ',
                    },
                    project = { enable = false },
                    mru = { limit = 9 },
                    shortcut = {
                        {
                            desc = ' Update',
                            group = 'HardHackerPurple',
                            action = 'PackerUpdate',
                            key = 'U' 
                        },
                        {
                            desc = ' Setup',
                            group = 'HardHackerCyan',
                            action = 'e ~/.config/nvim/init.lua',
                            key = 'S',
                        },
                    },
                    footer = {
                        '',
                        '',
                        '🚀 Hardhacker do hard things.',
                    },
                },
            }

            vim.cmd([[
            hi! link DashboardHeader  HardHackerRed
            hi! link DashboardFooter  HardHackerGeen
            ]])
        end
    }

    -- floaterm
    use {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_keymap_toggle = '<F12>'
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.9
            vim.g.floaterm_position = 'bottom'
        end
    }

    -- gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() 
            require('gitsigns').setup()
        end
    }

    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'onsails/lspkind.nvim' -- icons in autocomplete source
    use 'hrsh7th/nvim-cmp' -- autocomplete engine (see autocomplete.lua)
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for cmp
    use 'hrsh7th/cmp-buffer' -- buffer source for cmp
    use 'hrsh7th/cmp-path' -- path source for cmp

    -- lspsaga
    use 'tami5/lspsaga.nvim'
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

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false
    })

    --treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "go", "javascript", "markdown", "html", "css", "bash", "python" },
                sync_install = false,
                auto_install = true,
                ignore_install = { },

                highlight = {
                    enable = true,
                    disable = { },
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    }

    -- languages
    use 'fatih/vim-go'
    use 'pangloss/vim-javascript'

    use {
        'rust-lang/rust.vim',
        config = function()
            vim.g.rustfmt_autosave = 1
            vim.g.rustfmt_emit_files = 1
            vim.g.rustfmt_fail_silently = 0
        end
    }

    -- theme
    use {'dracula/vim', as = 'dracula'}
    use {'hardhackerlabs/theme-vim',  as = 'hardhacker'}

    -- bufferline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup{}
        end
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require'telescope'.setup{}
        end
    }

    -- nvim-tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'},
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
    }

    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }
end)
