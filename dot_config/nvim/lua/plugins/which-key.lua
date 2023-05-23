return {
  {
    "folke/which-key.nvim",
    opts = {
      layout = {
        height = { min = 4, max = 10 },
      },
    },
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup(opts)
      require("which-key").register({
        a = { name = "+Aerial" },
        b = { name = "+Buffer" },
        c = { name = "+CCC" },
        d = { name = "+Dap" },
        D = { name = "+Diffview" },
        f = { name = "+Telescope" },
        h = { name = "+Gitsings" },
        l = { name = "+Lazy" },
        m = { name = "+MarkdownPreview" },
        s = { name = "+Parameter" },
        t = { name = "+Traslate" },
        x = { name = "+Trouble" },
      }, { prefix = "<leader>" })
    end,
  },
}
