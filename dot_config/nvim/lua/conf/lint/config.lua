-- nvim lint
--
require("lint").linters_by_ft = {
  cpp = { "cpplint", },
  lua = { "luacheck", },
  markdown = { "markdownlint", }
}

vim.cmd("au TextChanged * lua require('lint').try_lint()")
