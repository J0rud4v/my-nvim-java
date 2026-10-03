-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Misc
vim.opt.list = false
vim.opt.guicursor = "i:ver100"
vim.opt.termguicolors = true

-- Folding (treesitter)
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true