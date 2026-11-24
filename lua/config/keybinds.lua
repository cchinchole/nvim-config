local opts = { silent = true }

-- Reverse case all hex values beside the x in a selection
vim.keymap.set('x', '<leader>uh',
  [[:<C-u>keeppatterns '<,'>s/\%V\x/\=submatch(0) =~# '\u' ? tolower(submatch(0)) : toupper(submatch(0))/g<CR>gv]],
  { silent = true, desc = 'Toggle case of hex digits in selection' })

-- Navigate splits
vim.keymap.set('n', '<C-h>', '<C-w>h',                  { silent = true, desc = "Window left" })
vim.keymap.set('n', '<C-j>', '<C-w>j',                  { silent = true, desc = "Window down" })
vim.keymap.set('n', '<C-k>', '<C-w>k',                  { silent = true, desc = "Window up" })
vim.keymap.set('n', '<C-l>', '<C-w>l',                  { silent = true, desc = "Window right" })

vim.keymap.set('n', '<A-h>', ':vertical resize +2<CR>', { silent = true, desc = "Increase width (right)" })
vim.keymap.set('n', '<A-j>', ':resize -2<CR>',          { silent = true, desc = "Decrease height (up)" })
vim.keymap.set('n', '<A-k>', ':resize +2<CR>',          { silent = true, desc = "Increase height (down)" })
vim.keymap.set('n', '<A-l>', ':vertical resize -2<CR>', { silent = true, desc = "Decrease width (left)" })

-- Vertical split with a new empty buffer
vim.keymap.set('n', '<leader>v', '<cmd>vnew<CR>', { desc = 'Vertical split, new buffer' })

-- Moving visual selection
vim.keymap.set('x', 'J', ":m '>+1<CR>gv=gv", { desc = 'moves lines down in visual selection' })
vim.keymap.set('x', 'K', ":m '<-2<CR>gv=gv", { desc = 'moves lines up in visual selection' })

-- Move selection horizontally
vim.keymap.set('x', '<', '<gv', opts)
vim.keymap.set('x', '>', '>gv', opts)

-- Jump half page with centering
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move down in buffer with cursor centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'move up in buffer with cursor centered' })

--Keep search match centered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Remove sticking to clipboard when deleting
vim.keymap.set({'n', 'x'}, 'x', '"_x', opts)
vim.keymap.set({'n', 'x'}, 'X', '"_x', opts)

-- Paste over selection without overwriting the clipboard (built-in visual P does this)
vim.keymap.set('x', 'p', 'P', opts)

-- Stop highlighting and escape insert
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', '<C-c>', ':nohl<CR>', { desc = 'Clear search hl', silent = true })

-- Disable Q
vim.keymap.set('n', 'Q', '<nop>')


-- Find and replace under keyboard
vim.keymap.set('n', '<leader>fr', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Yazi
vim.keymap.set('n', '-', function() vim.cmd('Yazi toggle') end, { desc = 'Open Yazi' })

-- LSP
for _, k in ipairs({ 'grr', 'grn', 'gra', 'gri', 'grt', 'grx' }) do
    pcall(vim.keymap.del, { 'n', 'x' }, k)
end
vim.keymap.set('n', 'gr',           vim.lsp.buf.references,         { desc = 'References' })
vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('i', '<Enter>', function() return vim.fn.pumvisible() == 1 and '<C-y>' or '<Enter>' end, { expr = true })
vim.keymap.set('n', '<leader>rn',   vim.lsp.buf.rename,             { desc = 'Rename symbol' })
vim.keymap.set('n', 'gd',           vim.lsp.buf.definition ,        { desc = 'Goto Definition' })
vim.keymap.set('n', 'gD',           vim.lsp.buf.declaration,        { desc = 'Goto Declaration' })
vim.keymap.set('n', 'gI',           vim.lsp.buf.implementation,     { desc = 'Goto Implementation' })
vim.keymap.set('n', 'gt',           vim.lsp.buf.type_definition,    { desc = 'Goto type definition' })

-- Conform
vim.keymap.set({'n', 'x'}, '<leader>l', function() require('conform').format({ async = false, timeout_ms = 500 }) end, { desc = 'Format' })

-- Neogit
vim.keymap.set('n', '<leader>gg', function() vim.cmd('Neogit') end, { desc = 'Show Neogit' })
vim.keymap.set('n', '<leader>gh', function() vim.cmd('DiffviewFileHistory %') end, { desc = 'File history (Diffview)' })

-- Undotree
vim.keymap.set('n', '<leader>ut', function() vim.cmd('UndotreeToggle') end, { desc = 'Undotree Toggle' })


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>e',    builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>pg',   builtin.git_files, { desc = 'Find Git Files' })
vim.keymap.set('n', '<leader>pw',   function() builtin.grep_string({ search = vim.fn.expand('<cword>')}) end, { desc = 'Grep cword'})
vim.keymap.set('n', '<leader>pr',   function() builtin.grep_string({ search = vim.fn.expand('<cWORD>')}) end, { desc = 'Grep cWORD'})
vim.keymap.set('n', '<leader>ps',   function() builtin.grep_string({ search = vim.fn.input('Grep: ')}) end, { desc = 'Greppy'})
vim.keymap.set('n', '<leader>sf',   builtin.lsp_document_symbols, { desc = 'Find Symbols (current file)' })
vim.keymap.set('n', '<leader>sg',   builtin.lsp_workspace_symbols, { desc = 'Find Symbols (workspace)' })
vim.keymap.set('n', '<leader>uc',   builtin.colorscheme, { desc = 'Colorschemes'})
