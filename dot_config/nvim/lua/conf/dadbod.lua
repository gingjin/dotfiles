-- dadbod
--
local g = vim.g
g.db_ui_winwidth = 30
g.db_ui_win_position = "left"
g.db_ui_show_database_icon = 1
g.db_ui_use_nerd_fonts = 1
g.db_ui_show_help = 0
g.db_ui_force_echo_notifications = 1
g.db_ui_auto_execute_table_helpers = 1

g.completion_chain_complete_list = {
  ["sql"] = {
    ["complete_items"] = { "vim-dadbod-completion" },
  },
}
g.completion_matching_strategy_list = { "exact", "substring" }
g.completion_matching_ignore_case = 1
