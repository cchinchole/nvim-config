-- Byte-compile and cache Lua modules for faster startup
vim.loader.enable()

-- Leader must be set before any plugin/keymap that references <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw entirely (yazi handles directories)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('plugins.colors')
require('plugins.treesitter')
require('plugins.lsp')
--require('plugins.oil')
require('plugins.yazi')
require('plugins.todocomments')
require('plugins.undotree')
require('plugins.telescope')
require('plugins.compilemode')
require('plugins.neogit')
require('config.options')
require('config.keybinds')
