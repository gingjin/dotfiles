local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
  s("ctex", {
    t({ "% !TEX program = xelatex", "" }),
    t({ "", "\\documentclass{article}" }),
    t({ "", "\\usepackage[UTF8]{ctex}", "" }),
    t({ "", "\\begin{document}", "" }),
    t({ "", "" }),
    i(1),
    t({ "", "" }),
    t({ "", "\\end{document}" }),
  }),
})
