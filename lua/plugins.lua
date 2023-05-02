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

    -- airline
    use {
        'vim-airline/vim-airline',
        requires = { 'vim-airline/vim-airline-themes' },
        config = function()
            vim.g.airline_theme = 'deus'
            vim.g.airline_powerline_fonts = 1
            vim.cmd([[
            if !exists('g:airline_symbols')
                let g:airline_symbols = {}
            endif
            ]])
        end
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

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require'telescope'.setup{}
        end
    }
    
    -- neo-tree
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim"
          -- {
          --   -- only needed if you want to use the commands with "_with_window_picker" suffix
          --   's1n7ax/nvim-window-picker',
          --   tag = "v1.*",
          --   config = function()
          --     require'window-picker'.setup({
          --       autoselect_one = true,
          --       include_current = false,
          --       filter_rules = {
          --         -- filter using buffer options
          --         bo = {
          --           -- if the file type is one of following, the window will be ignored
          --           filetype = { 'neo-tree', "neo-tree-popup", "notify" },

          --           -- if the buffer type is one of following, the window will be ignored
          --           buftype = { 'terminal', "quickfix" },
          --         },
          --       },
          --       other_win_hl_color = '#e35e4f',
          --     })
          --   end,
          -- }
        },

        config = function ()
            -- Unless you are still migrating, remove the deprecated commands from v1.x
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

            -- If you want icons for diagnostic errors, you'll need to define them somewhere:
            vim.fn.sign_define("DiagnosticSignError",
            {text = " ", texthl = "DiagnosticSignError"})
            vim.fn.sign_define("DiagnosticSignWarn",
            {text = " ", texthl = "DiagnosticSignWarn"})
            vim.fn.sign_define("DiagnosticSignInfo",
            {text = " ", texthl = "DiagnosticSignInfo"})
            vim.fn.sign_define("DiagnosticSignHint",
            {text = "", texthl = "DiagnosticSignHint"})
            -- NOTE: this is changed from v1.x, which used the old style of highlight groups
            -- in the form "LspDiagnosticsSignWarning"
            vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
        end
    }

    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }
end)
