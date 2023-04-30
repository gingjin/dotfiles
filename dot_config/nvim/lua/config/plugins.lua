require("G").map({
  { "n", "<leader>ly", ":Lazy<CR>", "Plugin manager" },
})

require("lazy").setup("plugins", {
  checker = {
    enabled = true,
    concurrency = 1,
    notify = true,
    frequency = 43200,
  },
  install = {
    colorscheme = { "nightfox", "habamax" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "none",
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "󰒲",
      loaded = "",
      not_loaded = "󰍕",
      plugin = "",
      runtime = "󱑒",
      source = "",
      start = "",
      task = "",
      list = {
        "󰝥",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
