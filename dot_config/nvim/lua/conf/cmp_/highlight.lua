-- " gray
vim.cmd("highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
-- " blue
vim.cmd("highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6")
vim.cmd("highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch")
-- " light blue
vim.cmd("highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE")
vim.cmd("highlight! link CmpItemKindInterface CmpItemKindVariable")
vim.cmd("highlight! link CmpItemKindText CmpItemKindVariable")
-- " pink
vim.cmd("highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0")
vim.cmd("highlight! link CmpItemKindMethod CmpItemKindFunction")
-- " front
vim.cmd("highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4")
vim.cmd("highlight! link CmpItemKindProperty CmpItemKindKeyword")
vim.cmd("highlight! link CmpItemKindUnit CmpItemKindKeyword")
