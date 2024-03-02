require("lazy").setup("plugins", {
  checker = {
    enabled = true,
    concurrency = 1,
    notify = true,
    frequency = 604800,
  },
  install = { colorscheme = { "nightfox" } },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "rounded",
  },
})
