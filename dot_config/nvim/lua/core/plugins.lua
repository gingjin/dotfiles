require("K").map("n", "<M-y>", ":Lazy<CR>", "Plugin manager")
require("lazy").setup("plugins", {
  git = {
    log = { "-8" },
    timeout = 120,
    url_format = "https://ghproxy.com/https://github.com/%s.git",
    filter = true,
  },
  checker = {
    enabled = true,
    concurrency = 1,
    notify = true,
    frequency = 43200,
  },
  install = { colorscheme = { "nightfox" } },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "double",
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
