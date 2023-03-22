local cmp_kinds = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = " ",
  Property = " ",
  Unit = " ",
  Value = " ",
  Enum = " ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = " ",
  Constant = " ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
}

local function insert(cmp, luasnip)
  return {
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-x>"] = cmp.mapping.complete(),
    ["<C-c>"] = cmp.mapping.close(),
    ["<A-f>"] = cmp.mapping.scroll_docs(4),
    ["<A-b>"] = cmp.mapping.scroll_docs(-4),
    ["<A-p>"] = cmp.mapping.select_prev_item(),
    ["<A-n>"] = cmp.mapping.select_next_item(),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end

local function cmdline(cmp)
  return {
    ["<A-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "c" }),
    ["<A-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "c" }),
  }
end

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
    { name = "path" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
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
  mapping = cmp.mapping.preset.insert(insert(cmp, luasnip)),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = cmp_kinds[vim_item.kind] or ""
      vim_item.menu = ({
        calc = "[Calc]",
        path = "[Path]",
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        luasnip = "[LuaSnip]",
      })[entry.source.name]
      return vim_item
    end,
  },
})

local sources = { "/", "?" }
for _, source in pairs(sources) do
  cmp.setup.cmdline(source, {
    mapping = cmp.mapping.preset.cmdline(cmdline(cmp)),
    sources = cmp.config.sources({
      { name = "buffer" },
      { name = "nvim_lsp_document_symbol" },
    }),
  })
end

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(cmdline(cmp)),
  sources = cmp.config.sources({
    { name = "path" },
    { name = "cmdline" },
  }),
})
