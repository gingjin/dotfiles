-- nvim cmp
--
local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
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
  enabled = function()
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
  end,
  sources = cmp.config.sources({
    { name = "dap" },
    { name = "calc" },
    { name = "path" },
    { name = "buffer" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "npm", keyword_length = 4 },
    { name = "nvim_lsp_signature_help" },
  }),
  buffer = {
    sources = {
      { name = "vim-dadbod-completion" },
    },
  },
  mapping = cmp.mapping.preset.insert(require("keymaps").cmp(cmp, luasnip)),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = require("conf.cmp_.icon").kinds[vim_item.kind]
      vim_item.menu = require("conf.cmp_.icon").menus[entry.source.name]
      return vim_item
    end,
  },
})

local sources = { "/", "?" }
for _, source in pairs(sources) do
  cmp.setup.cmdline(source, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "nvim_lsp_document_symbol" },
      { name = "buffer" },
    }),
  })
end

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "cmdline" },
    { name = "path" },
    { name = "buffer" },
  }),
})
