-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ','

vim.opt.number = true
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.smartcase = true

vim.opt.background = dark
vim.opt.termguicolors = true

vim.opt.splitbelow = true
vim.opt.splitright = true

require("config.lazy")

vim.keymap.set('i', 'jj', '<esc>', { noremap = true })

vim.keymap.set('n', '<C-J>', '<C-W><C-J>', {})
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', {})
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', {})
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', {})
