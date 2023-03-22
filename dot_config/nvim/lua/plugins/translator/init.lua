vim.g.translator_default_engines = { "bing", "haici" }

local G = require("G")
G.map({
  { "n", "<leader>tv", "<Plug>Translate" },
  { "v", "<leader>tv", "<Plug>TranslateV" },
  { "n", "<leader>tw", "<Plug>TranslateW" },
  { "v", "<leader>tw", "<Plug>TranslateWV" },
})

