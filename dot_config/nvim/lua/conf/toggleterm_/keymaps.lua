function _G.set_terminal_keymaps()
  local map = vim.api.nvim_buf_set_keymap
  local opt = { noremap = true }
  map(0, "t", "<esc>", "<C-\\><C-n>", opt)
  map(0, "t", "<A-h>", "<C-\\><C-n><C-w>h", opt)
  map(0, "t", "<A-j>", "<C-\\><C-n><C-w>j", opt)
  map(0, "t", "<A-k>", "<C-\\><C-n><C-w>k", opt)
  map(0, "t", "<A-l>", "<C-\\><C-n><C-w>l", opt)
end
local cmd = vim.api.nvim_command
cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
