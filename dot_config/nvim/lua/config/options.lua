vim.cmd("filetype plugin indent on")

local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/pyenv-3.8/bin/python"

local o = vim.opt
o.autoread = true
o.autowrite = true
o.clipboard:append("unnamedplus")
o.completeopt = { "menu", "menuone", "noselect" }
o.cursorline = true
o.expandtab = true
o.fileencodings = { "utf-8", "ucs-bom", "gbk" }
o.foldenable = false
o.foldlevel = 99
o.ignorecase = true
o.mouse = "a"
o.number = true
o.pumheight = 10
o.relativenumber = true
o.ruler = false
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

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "▎" },
  float = { border = "double" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local G = require("G")
for type, icon in pairs(G.signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
