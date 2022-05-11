-- nvim lazygit

local g = vim.g
g.lazygit_floating_window_winblend = 0.85
g.lazygit_floating_window_scaling_factor = 0.9
g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }
g.lazygit_floating_window_use_plenary = 1
g.lazygit_use_neovim_remote = 1

vim.cmd([[
if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif]])

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<leader>gg", [[:LazyGit<cr>]], opts)
