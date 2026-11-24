-- Register before vim.pack.add so it also fires on first install
vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Handle nvim-treesitter updates',
    group = vim.api.nvim_create_augroup('nvim-treesitter-pack-changed-update-handler', { clear = true }),
    callback = function(event)
        local name, kind = event.data.spec.name, event.data.kind
        if name == 'nvim-treesitter' and (kind == 'update' or kind == 'install') then
            if not event.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
            pcall(vim.cmd, 'TSUpdate')
        end
    end
})

vim.pack.add({
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        version = 'main'
    },
    { src = 'https://github.com/HiPhish/rainbow-delimiters.nvim' },
    { src = 'https://github.com/brenoprata10/nvim-highlight-colors' }
})

require('nvim-treesitter').install({ 'c', 'lua', 'vim', 'php', 'cpp', 'rust', 'go', 'bash', 'python', 'vimdoc', 'query',
    'c3', 'markdown', 'markdown_inline' })

-- The `main` branch does NOT enable highlighting/indent on its own.
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
    callback = function(args)
        if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
    end,
})

require('nvim-highlight-colors').setup({})

local rainbow_delimiters = require 'rainbow-delimiters'
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    }
}
