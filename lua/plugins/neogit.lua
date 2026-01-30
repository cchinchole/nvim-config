vim.pack.add({ 
    {src = 'https://github.com/NeogitOrg/neogit'},
    {src = 'https://github.com/nvim-lua/plenary.nvim'},
    {src = 'https://github.com/sindrets/diffview.nvim'},
})

require('diffview').setup({
    view = {
        file_history = {
            layout = 'diff2_horizontal'
        },
        default = {
            layout = 'diff2_horizontal'
        },
    },
    file_panel = {
        win_config = {
            position = 'left',
            width = 12
        },
        listing_style = 'list',
    },
    file_history_panel = {
        win_config = {
            height = 10
        },
    },
    default_args = {
        DiffviewFileHistory = { '%' },
    },
})


