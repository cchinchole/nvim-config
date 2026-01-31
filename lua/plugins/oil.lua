return {
    'stevearc/oil.nvim',
    dependencies = {
        'benomahony/oil-git.nvim',
        'echasnovski/mini.icons'
    },
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
            default_file_explorer = true,
            columns = {
                'permissions',
                'size',
            },
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            watch_for_changes = true,
            view_options = {
                show_hidden = true
            },
    }
}
