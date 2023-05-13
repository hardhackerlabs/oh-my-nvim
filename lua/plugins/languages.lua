return {
    {'fatih/vim-go'},
    {'pangloss/vim-javascript'},

    {
        'rust-lang/rust.vim',
        config = function()
            vim.g.rustfmt_autosave = 1
            vim.g.rustfmt_emit_files = 1
            vim.g.rustfmt_fail_silently = 0
        end
    },
}
