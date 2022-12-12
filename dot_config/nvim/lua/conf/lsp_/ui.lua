-- nvim lspsaga
--
local saga = require("lspsaga")
saga.init_lsp_saga({
  border_style = "double",
  move_in_saga = { prev = "<C-p>", next = "<C-n>" },
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  --show_diagnostic_source = true,
  code_action_icon = "",
  code_action_num_shortcut = true,
  finder_icons = {
    def = ' ',
    ref = '諭',
    link = ' ',
  },
  finder_request_timeout = 1500,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  rename_in_select = true,
  --definition_preview_icon = "  ",
})
