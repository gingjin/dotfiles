-- nvim cmp
--
local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
  -- view = { -- 当光标在屏幕底下时，自下而上选择
  --   entries = { name = "custom", selection_order = "near_cursor" }
  -- },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require("clangd_extensions.cmp_scores"),
      require("cmp-under-comparator").under,
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
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "color_names" },
    { name = "luasnip_choice" },
    { name = "npm", keyword_length = 4 },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip", option = { show_autosnippets = true } },
    { name = "buffer", option = { get_bufnrs = function() return vim.api.nvim_list_bufs() end } },
  }),
  mapping = cmp.mapping.preset.insert(require("conf.cmp_.keymaps").insert(cmp, luasnip)),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = require("conf.cmp_.icon").cmp_kinds[vim_item.kind] or ""
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
        color_names = "[Color]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

local sources = { "/", "?" }
for _, source in pairs(sources) do
  cmp.setup.cmdline(source, {
    mapping = cmp.mapping.preset.cmdline(require("conf.cmp_.keymaps").cmdline(cmp)),
    sources = cmp.config.sources({
      { name = "buffer" },
      { name = "nvim_lsp_document_symbol" }
    })
  })
end

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(require("conf.cmp_.keymaps").cmdline(cmp)),
  sources = cmp.config.sources({
    { name = "path" },
    { name = "cmdline" },
  })
})
