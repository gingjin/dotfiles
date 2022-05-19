-- nvim neoformat

-- local augroup = vim.api.nvim_create_augroup
-- local cmd = vim.api.nvim_create_autocmd
-- local formatOnSave = augroup("fmt", { clear = true })
-- cmd("BufWritePre", {
-- 	group = formatOnSave,
-- 	pattern = "*",
-- 	command = "undojoin | Neoformat",
-- })

local g = vim.g
g.neoformat_basic_format_trim = 1
g.neoformat_basic_format_retab = 1
g.neoformat_basic_format_align = 1
g.neoformat_run_all_formatters = 1
