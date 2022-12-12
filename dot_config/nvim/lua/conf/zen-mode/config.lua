-- nvim zen-mode
--
require("zen-mode").setup({
  window ={
    backdrop = 0.95,
    width = .85,
    height = 1,
    options = {
      signcolumn = "yes",
      number = true,
      relativenumber = true,
      cursorline = true,
      cursorcolumn = false,
      foldcolumn = "0",
      list = true,
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    twilight = { enabled = false },
    gitsigns = { enabled = true },
    tmux = { enabled = false },
    kitty = { enabled = false },
  },
  -- on_open = function (win)
  -- end,
  -- on_close = function ()
  -- end,
})
