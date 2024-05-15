vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('syntax enable')
vim.cmd('set completeopt=menu,menuone,noselect')

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
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.background = dark
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.backspace = "indent,eol,start"