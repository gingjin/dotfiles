-- nvim lint
--
require("lint").linters_by_ft = {
	cpp = { "cpplint" },
	python = { "flake8" },
}

vim.cmd("au BufEnter * lua require('lint').try_lint()")
vim.cmd("au BufWritePost <buffer> lua require('lint').try_lint()")
