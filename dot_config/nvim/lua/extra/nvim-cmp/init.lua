local G = require("G")
local M = require("extra.nvim-cmp.mappings")

local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_under_comparator = require("cmp-under-comparator")
cmp.setup({
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
    { name = "calc" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "async_path" },
    { name = "nvim_lsp_signature_help" },
    {
      name = "luasnip",
      option = {
        use_show_condition = true,
        show_autosnippets = true,
      },
    },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
  }),
  mapping = cmp.mapping.preset.insert(M.insert(cmp, luasnip)),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = G.cmp_kinds[vim_item.kind] or ""
      vim_item.menu = ({
        calc = "[Calc]",
        async_path = "[Path]",
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        luasnip = "[Snip]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

local sources = { "/", "?" }
for _, source in pairs(sources) do
  cmp.setup.cmdline(source, {
    mapping = cmp.mapping.preset.cmdline(M.cmdline(cmp)),
    sources = cmp.config.sources({
      { name = "buffer" },
      { name = "nvim_lsp_document_symbol" },
    }),
  })
end

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(M.cmdline(cmp)),
  sources = cmp.config.sources({
    { name = "async_path" },
    { name = "cmdline" },
  }),
})
