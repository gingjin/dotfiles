local g = vim.g
g.mapleader = " "
g.maplocalleader = " "
g.python3_host_prog = "~/.pyenv/versions/py3.7/bin/python3.7"

local cmd = vim.cmd
cmd("syntax enable")
cmd("filetype plugin indent on")

local options = {
	autowrite = true,
	autowriteall = true,
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menu", "menuone", "noselect" },
	-- conceallevel = 1,
	-- cursorcolumn = true,
	cursorline = true,
	encoding = "utf-8",
	expandtab = true,
	fileencodings = "ucs-bom,utf-8,gbk",
	foldenable = false,
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevel = 40,
	foldmethod = "expr",
	ignorecase = true,
	incsearch = true,
	linebreak = true,
	mouse = "a",
	number = true,
	relativenumber = true,
	scrolloff = 8,
	shiftround = true,
	shiftwidth = 2,
	showmode = false,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	smartindent = true,
	softtabstop = 2,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	undofile = true,
	wrap = true,
	writebackup = false,
}

local opt = vim.opt
for k, v in pairs(options) do
	opt[k] = v
end

local M = {}
M.servers = function()
	return {
		"bashls",
		"clangd",
		"cssls",
		"gopls",
		"html",
		"intelephense",
		"jdtls",
		"jsonls",
		"julials",
		"lemminx",
		"ltex",
		"pyright",
		"r_language_server",
		"rust_analyzer",
		"sorbet",
		"sqlls",
		"sumneko_lua",
		"tsserver",
		"vimls",
		"vuels",
		"yamlls",
	}
end

return M
