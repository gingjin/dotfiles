-- nvim lint
--
require("lint").linters_by_ft = {
  cpp = { "cpplint", },
  lua = { "luacheck", },
  markdown = { "markdownlint", }
}

local cpplint = require("lint").linters.cpplint
cpplint.args = {}

local luacheck = require("lint").linters.luacheck
luacheck.args = {}

local markdownlint = require("lint").linters.markdownlint
markdownlint.args = {}

vim.cmd("au BufWritePost lua require('lint').try_lint()")
