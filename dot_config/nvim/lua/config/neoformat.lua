-- nvim neoformat

local cmd = vim.api.nvim_command
cmd("augroup fmt")
cmd("autocmd!")
cmd("autocmd BufWritePre * undojoin | Neoformat")
cmd("augroup end")

local g = vim.g
g.neoformat_basic_format_trim = 1
g.neoformat_basic_format_retab = 1
g.neoformat_basic_format_align = 1
g.neoformat_run_all_formatters = 1

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<leader>i", [[:Neoformat<cr>]], opts)
