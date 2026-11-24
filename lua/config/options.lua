vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.updatetime = 250
vim.opt.splitbelow = true
vim.opt.signcolumn = 'yes'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 8
vim.g.editorconfig = true

-- System clipboard (deferred: provider detection can add startup time)
vim.schedule(function()
    vim.opt.clipboard:append("unnamedplus")
end)
