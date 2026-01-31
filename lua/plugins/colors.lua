return {
    'RRethy/base16-nvim',
    lazy = true,
    event = "vimEnter",
    dependencies = {
        'https://git.sr.ht/~swaits/colorsaver.nvim',
        'brenoprata10/nvim-highlight-colors',
        'HiPhish/rainbow-delimiters.nvim',
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('colorsaver').setup({})
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
    end
}
