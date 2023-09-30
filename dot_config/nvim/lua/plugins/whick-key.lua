return {
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      operators = { gc = "Comments", gb = "Comments" },
      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      layout = {
        height = { min = 5, max = 10 },
        spacing = 3,
        align = "left",
      },
    },
    config = function(_, opts)
      require("K").map("n", "<M-w>", "<Cmd>WhichKey<CR>", "Which Key")
      require("which-key").setup(opts)
      require("which-key").register({
        b = { name = "+Buffers" },
        c = { name = "+CCC" },
        d = { name = "+Dap" },
        f = { name = "+Telescope" },
        h = { name = "+Gitsigns" },
        l = { name = "+Vimtex" },
        m = { name = "+MarkdownPreview" },
        t = { name = "+Traslate" },
        x = { name = "+Trouble" },
      }, { mode = "n", prefix = "<leader>" })
      require("which-key").register({
        h = { name = "+Gitsigns" },
        t = { name = "+Traslate" },
      }, { mode = "x", prefix = "<leader>" })
    end,
  },
}
