-- nvim gitsigns
--
require("gitsigns").setup({
  signs = {
    add          = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change       = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete       = { hl = "GitSignsDelete", text = "╻", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete    = { hl = "GitSignsDelete", text = "╹", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "━", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    untracked    = { hl = "GitSignsAdd", text = "┇", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
  },
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  watch_gitdir = { interval = 1000, follow_files = true, },
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "right_align",
    delay = 1000,
    ignore_whitespace = true,
  },
  current_line_blame_formatter_opts = { relative_time = false },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = "double",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = { enable = false },
  on_attach = function(bufnr)
    local function bufmap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    require("conf.gitsigns_.keymaps").gitsigns(bufmap)
  end,
})
