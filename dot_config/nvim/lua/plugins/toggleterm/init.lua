function _G.set_terminal_keymaps()
  local map = vim.api.nvim_buf_set_keymap
  local opt = { noremap = true }
  map(0, "t", "<esc>", "<C-\\><C-n>", opt)
  map(0, "t", "<A-h>", "<C-\\><C-n><C-w>h", opt)
  map(0, "t", "<A-j>", "<C-\\><C-n><C-w>j", opt)
  map(0, "t", "<A-k>", "<C-\\><C-n><C-w>k", opt)
  map(0, "t", "<A-l>", "<C-\\><C-n><C-w>l", opt)
end

vim.api.nvim_command("autocmd! TermOpen term://* lua set_terminal_keymaps()")

require("toggleterm").setup({
  size = 10,
  open_mapping = [[<A-t>]],
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  close_on_exit = true,
  shell = vim.o.shell,
  direction = "float",
  float_opts = { border = "double" },
  highlights = {
    Normal = {
      guibg = "NONE",
      ctermbg = "NONE",
    },
  },
})
