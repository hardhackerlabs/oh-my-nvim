local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer() 

--

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'
    use 'rcarriga/nvim-notify'

    use {'nvim-tree/nvim-web-devicons', config = function() require('nvim-web-devicons/config')() end}

    -- Theme
    use {'dracula/vim', as = 'dracula'}
    use {'hardhackerlabs/theme-vim',  as = 'hardhacker', config = function() vim.cmd('colorscheme hardhacker') end}

    -- Starting screen
    use {
        'glepnir/dashboard-nvim',
        requires = {'nvim-tree/nvim-web-devicons'},
        event = 'VimEnter',
        config = function() require('dashboard-nvim/config')() end,
    }

    -- Terminal
    use {
        'voldikss/vim-floaterm',
        config = function()
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.9
            vim.g.floaterm_position = 'bottom'
            vim.cmd([[
            hi! link FloatermBorder Comment
            ]])
        end
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() 
            require('gitsigns').setup()
        end
    }

    -- Git diff
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('lualine/config')() end,
    }

    -- Builtin LSP
    use {'neovim/nvim-lspconfig', config = function() require('lspconfig/config')() end}
    use { 'williamboman/nvim-lsp-installer',
        config = function()
            require('nvim-lsp-installer').on_server_ready(function(server)
                local opts = { }
                server:setup(opts)
                vim.cmd([[ do User LspAttach Buffers ]])
            end)
    end}

    -- Auto completion
    use {'hrsh7th/nvim-cmp', config = function() require('autocmp/config')() end}
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path' 
    use 'hrsh7th/cmp-cmdline'

    use 'onsails/lspkind.nvim' -- icons in autocomplete source

    -- lspsaga
    use { 'tami5/lspsaga.nvim',
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
    end}

--    -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--    --     vim.lsp.diagnostic.on_publish_diagnostics, {
--    --         virtual_text = false
--    -- })
--
    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { },
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

    -- Tab management
    use {'akinsho/bufferline.nvim', tag = "v4.1.0", requires = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup {
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
                themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
                numbers = function(opts)
                    return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
                end,
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon',
                },
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = require('custom_opts').file_explorer_title,
                        text_align = "left",
                        separator = true,
                    }
                },
                color_icons = true, -- whether or not to add the filetype icon highlights
                separator_style = require('custom_opts').tab_style,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'},
                },
            }
        }
    end,
    }

    -- File find and search.
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require'telescope'.setup{}

            local option = {noremap = true, silent = true }

            local keys = require("custom_keys")
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', keys.find_files, builtin.find_files, option)
            vim.keymap.set('n', keys.live_grep, builtin.live_grep, option)
            vim.keymap.set('n', keys.search_cursor, builtin.grep_string, option)
            vim.keymap.set('n', keys.find_buffer, builtin.buffers, option)
        end,
    }

    -- File explorer
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

    -- Preview markdown files via brower. 
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }

    -- Colors highlighting
    use {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup{
                user_default_options = {
                    names = false,
                },
            }
        end,
    }

    -- resize the window
    use({'mrjones2014/smart-splits.nvim', tag = 'v1.2.2', config = function() require('smart-split/config')() end })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
