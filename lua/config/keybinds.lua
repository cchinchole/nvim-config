local opts = { noremap = true, silent = true }

-- Sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Navigate splits
vim.keymap.set('n', '<A-h>', '<C-w>h',                  opts)
vim.keymap.set('n', '<A-j>', '<C-w>j',                  opts)
vim.keymap.set('n', '<A-k>', '<C-w>k',                  opts)
vim.keymap.set('n', '<A-l>', '<C-w>l',                  opts)
vim.keymap.set('t', '<A-h>', [[<C-\><C-n><C-w>h]],      opts)
vim.keymap.set('t', '<A-j>', [[<C-\><C-n><C-w>j]],      opts)
vim.keymap.set('t', '<A-k>', [[<C-\><C-n><C-w>k]],      opts)
vim.keymap.set('t', '<A-l>', [[<C-\><C-n><C-w>l]],      opts)
vim.keymap.set('n', '<C-h>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<C-j>', ':resize -2<CR>',          opts)
vim.keymap.set('n', '<C-k>', ':resize +2<CR>',          opts)
vim.keymap.set('n', '<C-l>', ':vertical resize -2<CR>', opts)

-- Moving visual selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Move selection horizontally
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Jump half page with centering
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

--Keep search match centered
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

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
vim.keymap.set('n', '<C-o>', function() vim.cmd('Oil') end, { desc = 'Open oil' }) 

-- Terminal
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = 'Exit terminal insert mode' })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(eh)
        vim.keymap.set('i', '<Enter>', function() return vim.fn.pumvisible() == 1 and '<C-y>' or '<Enter>' end, { expr = true })
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({border='single'}) end,{ desc = 'Show hover',buffer=eh.buf})
        vim.keymap.set('n', '<leader>rn',   vim.lsp.buf.rename,         { desc = 'Rename symbol', buffer = eh.buf })
        vim.keymap.set('n', '<leader>fl',   vim.lsp.buf.format,         { desc = 'Format LSP', buffer = eh.buf})
        vim.keymap.set('n', 'gd',           vim.lsp.buf.definition ,    { desc = 'Goto Definition', buffer = eh.buf })
        vim.keymap.set('n', 'gD',           vim.lsp.buf.declaration,    { desc = 'Goto Declaration', buffer=eh.buf })
        vim.keymap.set('n', 'gI',           vim.lsp.buf.implementation, { desc = 'Goto Implementation', buffer=eh.buf })
        vim.keymap.set('n', 'gr',           vim.lsp.buf.references,     { desc = 'References', buffer=eh.buf })
        vim.keymap.set('n', 'gt',           vim.lsp.buf.type_definition,{ desc = 'Goto type definition',buffer=eh.buf })
        vim.keymap.set('n', 'sh',           vim.lsp.buf.signature_help, { desc = 'Show signature',buffer=eh.buf})
    end
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
vim.keymap.set('n', '<leader>u', function() vim.cmd('UndotreeToggle') end, { desc = 'Undotree Toggle' }) 

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>e',    builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>pg',   builtin.git_files, { desc = 'Find Those Girlfriend Files' })
vim.keymap.set('n', '<leader>pw',   function() builtin.grep_string({ search = vim.fn.expand('<cword>')}) end, { desc = 'Search cword'}) 
vim.keymap.set('n', '<leader>pr',   function() builtin.grep_string({ search = vim.fn.expand('<cWORD>')}) end, { desc = 'Search cWORD'}) 
vim.keymap.set('n', '<leader>ps',   function() builtin.grep_string({ search = vim.fn.input('Grep: ')}) end, { desc = 'Greppy'}) 
vim.keymap.set('n', '<leader>sf',   builtin.lsp_document_symbols, { desc = 'Find Symbols (current file)' })
vim.keymap.set('n', '<leader>sg',   builtin.lsp_workspace_symbols, { desc = 'Find Symbols (workspace)' })
vim.keymap.set('n', '<leader>sh',   builtin.help_tags, { desc = 'Help menu'})

local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function colorscheme_with_preview(opts)
  opts = opts or {}
  opts.attach_mappings = function(prompt_bufnr, map)
    local function apply_preview()
      local entry = action_state.get_current_picker(prompt_bufnr):get_selection()
      if not entry then return end
      local name = entry.value or entry
      pcall(vim.cmd, "colorscheme " .. name)
    end

    -- preview on move
    map("i", "<esc>", actions.close) -- keep default esc behavior
    map("i", "<C-j>", function() actions.move_selection_next(prompt_bufnr); apply_preview() end)
    map("i", "<C-k>", function() actions.move_selection_previous(prompt_bufnr); apply_preview() end)
    map("n", "j", function() actions.move_selection_next(prompt_bufnr); apply_preview() end)
    map("n", "k", function() actions.move_selection_previous(prompt_bufnr); apply_preview() end)

    -- preview when selection changes by typing/filtering
    local picker = action_state.get_current_picker(prompt_bufnr)
    if picker then
      picker:register_completion_callback(function()
        apply_preview()
      end)
    end

    -- on accept keep the selected scheme (default)
    actions.select_default:enhance({
      post = function()
        actions.close(prompt_bufnr)
      end,
    })

    -- on close without selection, optionally restore previous scheme
    local prev_cs = vim.g.colors_name
    actions.close:enhance({
      post = function()
        if vim.g.colors_name == nil or vim.g.colors_name == "" then
          pcall(vim.cmd, "colorscheme " .. (prev_cs or "default"))
        end
      end,
    })

    return true
  end

  builtin.colorscheme(opts)
end
vim.keymap.set("n", "<leader>sc", colorscheme_with_preview, { desc = "Colorscheme picker (live preview)" })
