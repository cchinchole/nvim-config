return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'j-hui/fidget.nvim',
        'stevearc/conform.nvim'
    },
    lazy = false,
    config = function()
        vim.diagnostic.config({
            virtual_lines = false,
            virtual_text = {
                severity = { min = vim.diagnostic.severity.ERROR },
                spacing = 4,
                prefix = '●',
            },
            float = {
                focusable = false,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
            signs = true,
            underline = false,
            update_in_insert = false,
            severity_sort = true,
        })

        -- Setup nvim-cmp
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For LuaSnip
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            }),
        })

        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                python = { 'isort', 'black' },
                rust = { 'rustfmt' },
                c = { 'clang-format' },
                cpp = { 'clang-format' },
                go = { 'gofmt' }
            },
        })

        -- Disable the annoying vim warnings
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'}
                    },
                    telemetry = {
                        enable = false
                    }
                }
            }
        })
        vim.lsp.enable({ 'clangd', 'lua_ls', 'rust_analyzer', 'gopls' })
    end
}
