-- nvim lint
--
require("lint").linters_by_ft = {
  cpp = { "cpplint" },
  python = { "flake8" },
  bash = { "shellcheck" },
  go = { "golangcilint" },
}

vim.cmd("autocmd TextChanged * lua require('lint').try_lint()")
