vim.cmd("hi link AerialClass Type")
vim.cmd("hi link AerialClassIcon Special")
vim.cmd("hi link AerialFunction Special")
vim.cmd("hi AerialFunctionIcon guifg=#cb4b16 guibg=NONE guisp=NONE gui=NONE cterm=NONE")

-- " There's also this group for the cursor position
vim.cmd("hi link AerialLine QuickFixLine")
-- " If highlight_mode="split_width", you can set a separate color for the
-- " non-current location highlight
vim.cmd("hi AerialLineNC guibg=Gray")

-- " You can customize the guides (if show_guide=true)
vim.cmd("hi link AerialGuide Comment")
-- " You can set a different guide color for each level
vim.cmd("hi AerialGuide1 guifg=Red")
vim.cmd("hi AerialGuide2 guifg=Blue")
