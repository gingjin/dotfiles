return {
  {
    "rcarriga/nvim-notify",
    opts = function()
      return {
        background_colour = "#000000",
        top_down = false,
        timeout = 2000,
        minimum_width = 40,
        stages = "slide",
      }
    end,
    config = function(_, opts)
      require("notify").setup(opts)

      vim.notify = require("notify")
      require("extra.nvim-notify.lsp_status").lsp_status()
    end,
  },
}
