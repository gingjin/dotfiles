-- nvim lint
--
require("lint").linters_by_ft = {
	cpp = { "cpplint" },
	python = { "flake8" },
}

vim.cmd("au InsertLeave * lua require('lint').try_lint()")
