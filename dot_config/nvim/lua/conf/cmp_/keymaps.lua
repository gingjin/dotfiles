local M = {}
M.keymap = function(cmp, luasnip)
  return {
    ['<C-e>'] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-c>"] = cmp.mapping.close(),
    ["<A-f>"] = cmp.mapping.scroll_docs(4),
    ["<A-b>"] = cmp.mapping.scroll_docs(-4),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end
return M
