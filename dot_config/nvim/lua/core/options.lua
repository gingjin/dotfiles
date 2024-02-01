vim.cmd("filetype plugin indent on")

local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/nvim_env38/bin/python"

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

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "▎" },
  float = { border = "double" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

for type, icon in pairs(require("G").signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "", texthl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "", texthl = "", numhl = "" })
sign("DapLogPoint", { text = "", texthl = "", numhl = "" })
sign("DapStopped", { text = "➤", texthl = "", numhl = "" })
sign("DapBreakpointRejected", { text = "", texthl = "", numhl = "" })
