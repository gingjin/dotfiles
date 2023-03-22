local G = require("G")
G.map({
  { "n", "<leader>ct", ":ColorizerToggle<CR>" },
})

require("colorizer").setup({
  ["*"] = {
    RGB = true,
    RRGGBB = true,
    names = true,
    RRGGBBAA = false,
    rgb_fn = false,
    hsl_fn = false,
    css = false,
    css_fn = false,
    mode = "background",
  },
})
