return {
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    opts = function()
      return {
        padding = true,
        sticky = true,
        ignore = "^$",
        toggler = { line = "gcc", block = "gbc" },
        opleader = { line = "gc", block = "gb" },
        extra = { above = "gcO", below = "gco", eol = "gcA" },
        mappings = { basic = true, extra = true, extended = true },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        post_hook = nil,
      }
    end,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
}
