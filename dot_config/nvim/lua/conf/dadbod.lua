-- dadbod
--
local g = vim.g
g.db_ui_winwidth = 30
g.db_ui_win_position = "left"
g.db_ui_show_help = 0
g.db_ui_force_echo_notifications = 1
g.db_ui_auto_execute_table_helpers = 1
g.db_ui_icons = {
  ["expanded"] = {
    db = ' ',
    buffers = ' ',
    saved_queries = ' ',
    schemas = ' ',
    schema = ' פּ',
    tables = ' 藺',
    table = ' ',
  },
  ["collapsed"] = {
    db = ' ',
    buffers = ' ',
    saved_queries = ' ',
    schemas = ' ',
    schema = ' פּ',
    tables = ' 藺',
    table = ' ',
  },
  ["saved_query"] = '',
  ["new_query"] = '璘',
  ["tables"] = 'ﴴ',
  ["buffers"] = '﬘',
  ["add_connection"] = '',
  ["connection_ok"] = '✓',
  ["connection_error"] = '✕',
}

g.completion_chain_complete_list = {
  ["sql"] = {
    ["complete_items"] = { "vim-dadbod-completion" },
  },
}
g.completion_matching_strategy_list = { "exact", "substring" }
g.completion_matching_ignore_case = 1
