return {
  {
    "hrsh7th/nvim-cmp",
    event = "BufRead",
    opts = function()
      local M = require("extra.nvim-cmp.mappings")
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local cmp_under_comparator = require("cmp-under-comparator")
      return {
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp_under_comparator.under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "buffer" },
          { name = "luasnip" },
          { name = "rpncalc" },
          { name = "nvim_lua" },
          { name = "nvim_lsp" },
          { name = "async_path" },
          { name = "nvim_lsp_signature_help" },
        }),
        mapping = cmp.mapping.preset.insert(M.insert(cmp, luasnip)),
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = require("G").cmp_kinds[vim_item.kind] or ""
            vim_item.menu = ({
              buffer = "[Buf]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[Lua]",
              luasnip = "[Snip]",
              rpncalc = "[RCalc]",
              async_path = "[Path]",
            })[entry.source.name]
            return vim_item
          end,
        },
      }
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      cmp.setup(opts)
      local M = require("extra.nvim-cmp.mappings")
      local mapping = cmp.mapping.preset.cmdline(M.cmdline(cmp))
      for _, source in pairs({ "/", "?" }) do
        cmp.setup.cmdline(source, {
          mapping = mapping,
          sources = cmp.config.sources({
            { name = "nvim_lsp_document_symbol" },
            { name = "buffer" },
          }),
        })
      end
      cmp.setup.cmdline(":", {
        mapping = mapping,
        sources = cmp.config.sources({
          { name = "async_path" },
          { name = "cmdline" },
        }),
      })
    end,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
      "PhilRunninger/cmp-rpncalc",
      "FelipeLema/cmp-async-path",
      "lukas-reineke/cmp-under-comparator",
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
        "abecodes/tabout.nvim",
        opts = {
          tabkey = "<Tab>",
          backwards_tabkey = "<S-Tab>",
          act_as_tab = true,
          act_as_shift_tab = true,
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
