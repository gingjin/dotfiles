vim.cmd("filetype plugin indent on")

local g = vim.g
g.mapleader = " "
g.maplocalleader = " "

local o = vim.opt
o.autoread = true
o.autowrite = true
o.clipboard = "unnamedplus"
o.completeopt = { "menu", "menuone", "noselect" }
o.cursorline = true
o.expandtab = true
o.fileencodings = { "utf-8", "ucs-bom", "gbk" }
o.ignorecase = true
o.mouse = "a"
o.number = true
o.pumheight = 10
o.relativenumber = true
o.ruler = true
o.scrolloff = 5
o.shiftround = true
o.shiftwidth = 2
o.showmode = true
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.tabstop = 2
o.termguicolors = true
