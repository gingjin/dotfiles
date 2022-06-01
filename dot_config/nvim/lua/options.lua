local cmd = vim.cmd
cmd("filetype plugin indent on")

local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.python3_host_prog = "~/.pyenv/versions/py3.7/bin/python"

local opt = vim.opt
opt.autoread = true
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.encoding = "UTF-8"
opt.expandtab = true
opt.fileencodings = "ucs-bom,utf-8,gbk"
opt.foldenable = false
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.ignorecase = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftround = true
opt.shiftwidth = 2
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
