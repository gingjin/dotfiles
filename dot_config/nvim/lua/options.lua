vim.cmd("filetype plugin indent on")

local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.python3_host_prog = os.getenv("HOME")  .. "/.pyenv/versions/pyenv-3.8/bin/python"

local o = vim.opt
o.autoread = true
o.autowrite = true
o.clipboard:append("unnamedplus")
o.completeopt = { "menu", "menuone", "noselect" }
o.cursorline = true
o.expandtab = true
o.fileencodings = { "ucs-bom", "utf-8", "gbk" }
o.foldenable = false
o.foldlevel = 99
o.ignorecase = true
o.mouse = "a"
o.number = true
o.pumheight = 10
o.relativenumber = true
o.scrolloff = 5
o.shiftround = true
o.shiftwidth = 2
o.showmode = false
o.signcolumn = "yes"
o.smartcase = true
o.smartindent = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.tabstop = 2
o.termguicolors = true
o.timeoutlen = 800
