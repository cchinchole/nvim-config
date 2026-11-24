vim.pack.add({
    {src ='https://github.com/mikavilpas/yazi.nvim'},
    {src ='https://github.com/nvim-lua/plenary.nvim'},
})

require('yazi').setup({
    -- Open yazi instead of netrw for `nvim .`, `:e some/dir`, etc.
    -- (netrw itself is disabled in init.lua so it never loads)
    open_for_directories = true,

    -- yazi.nvim only supports a floating window, so make it cover the whole
    -- editor with no border: it looks like a buffer taking over the screen.
    floating_window_scaling_factor = 1,
    yazi_floating_window_border = 'none',
})
