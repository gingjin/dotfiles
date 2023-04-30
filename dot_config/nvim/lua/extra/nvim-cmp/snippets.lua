local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("tex", {
  s("ctex", {
    t({
      "% !TEX program = xelatex",
      "",
      "\\documentclass{article}",
      "\\usepackage[UTF8]{ctex}",
      "",
      "\\begin{document}",
      "  ",
      i(1),
      "",
      "\\end{document}",
    }),
  }),
})
