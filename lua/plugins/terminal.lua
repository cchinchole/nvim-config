return {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
        size = 10,
        open_mapping = [[<C-t>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = false,
        shell = vim.o.shell
    }
}
