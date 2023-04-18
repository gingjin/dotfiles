return {
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = function()
      return {
        layout = {
          height = { min = 4, max = 10 },
        },
      }
    end,
    config = function(_, opts)
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
        t = { name = "+Traslate" },
        v = { name = "+VimTex" },
        x = { name = "+Trouble" },
      }, { prefix = "<leader>" })
    end,
  },
}
