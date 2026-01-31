local opts = { noremap = true, silent = true }

-- Sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Navigate splits
vim.keymap.set('n', '<A-h>', '<C-w>h',                  { noremap = true, silent = true, desc = "Window left" })
vim.keymap.set('n', '<A-j>', '<C-w>j',                  { noremap = true, silent = true, desc = "Window down" })
vim.keymap.set('n', '<A-k>', '<C-w>k',                  { noremap = true, silent = true, desc = "Window up" })
vim.keymap.set('n', '<A-l>', '<C-w>l',                  { noremap = true, silent = true, desc = "Window right" })
vim.keymap.set('t', '<A-h>', [[<C-\><C-n><C-w>h]],      { noremap = true, silent = true })
vim.keymap.set('t', '<A-j>', [[<C-\><C-n><C-w>j]],      { noremap = true, silent = true })
vim.keymap.set('t', '<A-k>', [[<C-\><C-n><C-w>k]],      { noremap = true, silent = true })
vim.keymap.set('t', '<A-l>', [[<C-\><C-n><C-w>l]],      { noremap = true, silent = true })
vim.keymap.set('n', '<C-h>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = "Increase width (right)" })
vim.keymap.set('n', '<C-j>', ':resize -2<CR>',          { noremap = true, silent = true, desc = "Decrease height (up)" })
vim.keymap.set('n', '<C-k>', ':resize +2<CR>',          { noremap = true, silent = true, desc = "Increase height (down)" })
vim.keymap.set('n', '<C-l>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = "Decrease width (left)" })

-- Moving visual selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'moves lines down in visual selection' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'moves lines up in visual selection' })

-- Move selection horizontally
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Jump half page with centering
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move down in buffer with cursor centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'move up in buffer with cursor centered' })

--Keep search match centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Remove sticking to clipboard when deleting
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('v', 'x', '"_x', opts)

-- Keep yanked after pasting
vim.keymap.set('v', 'p', '"_dp', opts)  

-- Stop highlighting and escape insert
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', '<C-c>', ':nohl<CR>', { desc = 'Clear search hl', silent = true })

-- Disable Q
vim.keymap.set('n', 'Q', '<nop>')


-- Find and replace under keyboard
vim.keymap.set('n', '<leader>fr', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Oil
vim.keymap.set('n', '<C-o>', function() vim.cmd('Oil') end, { desc = 'Open Dired' }) 

-- Terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal insert mode' })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(eh)
        vim.keymap.set('i', '<Enter>', function() return vim.fn.pumvisible() == 1 and '<C-y>' or '<Enter>' end, { expr = true })
        vim.keymap.set('n', '<leader>rn',   vim.lsp.buf.rename,                     { desc = 'Rename symbol', buffer = eh.buf })
        vim.keymap.set('n', '<leader>fl',   vim.lsp.buf.format,                     { desc = 'Format LSP', buffer = eh.buf})
        vim.keymap.set('n', 'gd',           vim.lsp.buf.definition ,                { desc = 'Goto Definition', buffer = eh.buf })
        vim.keymap.set('n', 'gD',           vim.lsp.buf.declaration,                { desc = 'Goto Declaration', buffer=eh.buf })
        vim.keymap.set('n', 'gI',           vim.lsp.buf.implementation,             { desc = 'Goto Implementation', buffer=eh.buf })
        vim.keymap.set('n', 'gr',           vim.lsp.buf.references,                 { desc = 'References', buffer=eh.buf })
        vim.keymap.set('n', 'gt',           vim.lsp.buf.type_definition,            { desc = 'Goto type definition',buffer=eh.buf })
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({border='single'}) end,{ desc = 'Show hover',buffer=eh.buf})
        vim.keymap.set('n', 'sh',           vim.lsp.buf.signature_help,             { desc = 'Show signature',buffer=eh.buf})
    end,
})

-- Conform
vim.keymap.set({'n', 'v'}, '<leader>l', function() require('conform').format({lsp_fallback = true, async = false, timeout_ms = 500}) end, { desc = 'Format' })

-- Harpoon
local harpoon = require('harpoon')

vim.keymap.set('n', '<A-a>', function() harpoon:list():add() end,                           { desc = 'Harpoon Append' })
vim.keymap.set('n', '<A-w>', function() harpoon:list():remove() vim.cmd('bdelete') end,     { desc = 'Harpoon Append' })
vim.keymap.set('n', '<A-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,   { desc = 'Harpoon Menu' })
vim.keymap.set('n', '<A-1>', function() harpoon:list():select(1) end,                       { desc = 'Harpoon select' })
vim.keymap.set('n', '<A-2>', function() harpoon:list():select(2) end,                       { desc = 'Harpoon select' })
vim.keymap.set('n', '<A-3>', function() harpoon:list():select(3) end,                       { desc = 'Harpoon select' })
vim.keymap.set('n', '<A-4>', function() harpoon:list():select(4) end,                       { desc = 'Harpoon select' })
vim.keymap.set('n', '<A-5>', function() harpoon:list():select(5) end,                       { desc = 'Harpoon select' })

-- Neogit
vim.keymap.set('n', '<leader>gg', function() vim.cmd('Neogit') end, { desc = 'Show Neogit' }) 
vim.keymap.set('n', '<leader>gh', function() vim.cmd('DiffviewFileHistory %') end, { desc = 'Show Neogit' }) 

-- Undotree
vim.keymap.set('n', '<leader>ut', function() vim.cmd('UndotreeToggle') end, { desc = 'Undotree Toggle' }) 


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>e',    builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>pg',   builtin.git_files, { desc = 'Find Those Girlfriend Files' })
vim.keymap.set('n', '<leader>pw',   function() builtin.grep_string({ search = vim.fn.expand('<cword>')}) end, { desc = 'CWORD'}) 
vim.keymap.set('n', '<leader>pr',   function() builtin.grep_string({ search = vim.fn.expand('<cWORD>')}) end, { desc = 'CWORD'}) 
vim.keymap.set('n', '<leader>ps',   function() builtin.grep_string({ search = vim.fn.input('Grep: ')}) end, { desc = 'Greppy'}) 
vim.keymap.set('n', '<leader>sf',   builtin.lsp_document_symbols, { desc = 'Find Symbols (current file)' })
vim.keymap.set('n', '<leader>sg',   builtin.lsp_workspace_symbols, { desc = 'Find Symbols (workspace)' })
vim.keymap.set('n', '<leader>uc',   builtin.colorscheme, { desc = 'Colorschemes'})
