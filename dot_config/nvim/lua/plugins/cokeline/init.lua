local G = require("G")
G.map({
  { "n", "<Tab>", "<Plug>(cokeline-focus-next)" },
  { "n", "<S-Tab>", "<Plug>(cokeline-focus-prev)" },
  { "n", "<leader>1", "<Plug>(cokeline-focus-1)<CR>" },
  { "n", "<leader>2", "<Plug>(cokeline-focus-2)<CR>" },
  { "n", "<leader>3", "<Plug>(cokeline-focus-3)<CR>" },
  { "n", "<leader>4", "<Plug>(cokeline-focus-4)<CR>" },
  { "n", "<leader>5", "<Plug>(cokeline-focus-5)<CR>" },
  { "n", "<leader>6", "<Plug>(cokeline-focus-6)<CR>" },
  { "n", "<leader>7", "<Plug>(cokeline-focus-7)<CR>" },
  { "n", "<leader>8", "<Plug>(cokeline-focus-8)<CR>" },
  { "n", "<leader>9", "<Plug>(cokeline-focus-9)<CR>" },
})

require("cokeline").setup({
  default_hl = {
    fg = G.colors.text,
    bg = "none",
  },
  sidebar = {
    filetype = "NvimTree",
    components = {
      { text = "  NvimTree", style = "bold" },
    },
  },
  components = {
    { text = " " },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.is_focused and buffer.devicon.color
      end,
    },
    {
      text = function(buffer)
        return buffer.unique_prefix
      end,
      style = function(buffer)
        return buffer.is_focused and "bold" or nil
      end,
      fg = function(buffer)
        return buffer.is_focused and G.colors.fg or nil
      end,
    },
    {
      text = function(buffer)
        return buffer.filename
      end,
      style = function(buffer)
        return buffer.is_focused and "bold" or nil
      end,
      fg = function(buffer)
        return buffer.is_focused and G.colors.fg or nil
      end,
    },
    {
      text = function(buffer)
        local errors = buffer.diagnostics.errors
        return (errors ~= 0 and " " .. G.icons.err .. errors) or ""
      end,
      fg = function(buffer)
        local errors = buffer.diagnostics.errors
        return (errors ~= 0 and G.colors.red) or nil
      end,
    },
    {
      text = function(buffer)
        local warnings = buffer.diagnostics.warnings
        return (warnings ~= 0 and " " .. G.icons.warn .. warnings) or ""
      end,
      fg = function(buffer)
        local warnings = buffer.diagnostics.warnings
        return (warnings ~= 0 and G.colors.yellow) or nil
      end,
    },
    {
      text = function(buffer)
        local infos = buffer.diagnostics.infos
        return (infos ~= 0 and " " .. G.icons.info .. infos) or ""
      end,
      fg = function(buffer)
        local infos = buffer.diagnostics.infos
        return (infos ~= 0 and G.colors.blue) or nil
      end,
    },
    {
      text = function(buffer)
        local hints = buffer.diagnostics.hints
        return (hints ~= 0 and " " .. G.icons.hint .. hints) or ""
      end,
      fg = function(buffer)
        local hints = buffer.diagnostics.hints
        return (hints ~= 0 and G.colors.green) or nil
      end,
    },
    {
      text = function(buffer)
        local modified = buffer.is_modified
        return modified and G.icons.modifie or G.icons.close
      end,
      fg = function(buffer)
        local modified = buffer.is_modified
        local focused = buffer.is_focused
        return modified and G.colors.orange or focused and G.colors.fg or nil
      end,
      delete_buffer_on_left_click = true,
    },
  },
})
