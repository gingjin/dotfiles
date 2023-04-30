return {
  {
    "hrsh7th/nvim-cmp",
    event = "BufRead",
    config = function()
      require("extra.nvim-cmp.init")
    end,
    dependencies = {
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
      "FelipeLema/cmp-async-path",
      "lukas-reineke/cmp-under-comparator",
      {
        "windwp/nvim-autopairs",
        opts = {
          disable_filetype = { "TelescopePrompt", "vim" },
          enable_check_bracket_line = false,
          fast_wrap = {
            map = "<M-i>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = [=[[%'%"%)%>%]%)%}%,]]=],
            end_key = "$",
            keys = "qwertyuiopzxcvbnmasdfghjkl",
            check_comma = true,
            highlight = "Search",
            highlight_grey = "Comment",
          },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
          local Rule = require("nvim-autopairs.rule")
          require("nvim-autopairs").add_rule(Rule("$", "$", { "markdown" }))
        end,
      },
      {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        config = function()
          require("extra.nvim-cmp.snippets")
        end,
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
      {
        "abecodes/tabout.nvim",
        opts = {
          tabkey = "<Tab>",
          backwards_tabkey = "<S-Tab>",
          act_as_tab = true,
          act_as_shift_tab = false,
          default_tab = "<C-t>",
          default_shift_tab = "<C-d>",
          enable_backwards = true,
          completion = true,
          tabouts = {
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
          },
          ignore_beginning = true,
          exclude = {},
        },
      },
    },
  },
}
