local G = require("G")

return {
  {
    "willothy/nvim-cokeline",
    event = "BufReadPre",
    init = function()
      G.map({
        { "n", "<leader>bn", "<Plug>(cokeline-focus-next)", "Focus Next Buffer" },
        { "n", "<leader>bp", "<Plug>(cokeline-focus-prev)", "Focus Previous Buffer" },
        { "n", "<leader>b1", "<Plug>(cokeline-focus-1)<CR>", "Focus Buffer 1" },
        { "n", "<leader>b2", "<Plug>(cokeline-focus-2)<CR>", "Focus Buffer 2" },
        { "n", "<leader>b3", "<Plug>(cokeline-focus-3)<CR>", "Focus Buffer 3" },
        { "n", "<leader>b4", "<Plug>(cokeline-focus-4)<CR>", "Focus Buffer 4" },
        { "n", "<leader>b5", "<Plug>(cokeline-focus-5)<CR>", "Focus Buffer 5" },
        { "n", "<leader>b6", "<Plug>(cokeline-focus-6)<CR>", "Focus Buffer 6" },
        { "n", "<leader>b7", "<Plug>(cokeline-focus-7)<CR>", "Focus Buffer 7" },
        { "n", "<leader>b8", "<Plug>(cokeline-focus-8)<CR>", "Focus Buffer 8" },
        { "n", "<leader>b9", "<Plug>(cokeline-focus-9)<CR>", "Focus Buffer 9" },
      })
    end,
    opts = function()
      return {
        default_hl = {
          fg = function(buffer)
            return buffer.is_focused and G.colors.fg1 or G.colors.fg2
          end,
          bg = G.colors.bg2,
        },
        components = {
          {
            text = function(buffer)
              local _text = ""
              if buffer.is_focused or buffer.is_first then
                _text = _text .. ""
              elseif buffer.index > 1 then
                _text = " "
              end
              return _text
            end,
            fg = function(buffer)
              if buffer.is_focused then
                return G.colors.bg1
              elseif buffer.is_first then
                return G.colors.bg0
              end
            end,
            bg = function(buffer)
              if buffer.is_first then
                return G.colors.bg2
              else
                return G.colors.bg0
              end
            end,
          },
          -- {
          --   text = function(buffer)
          --     return buffer.index .. ". "
          --   end,
          --   style = function(buffer)
          --     return buffer.is_focused and "bold" or nil
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and G.colors.bg1 or G.colors.bg0
          --   end,
          -- },
          {
            text = function(buffer)
              return buffer.devicon.icon
            end,
            fg = function(buffer)
              return buffer.is_focused and buffer.devicon.color
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg1 or G.colors.bg0
            end,
          },
          {
            text = function(buffer)
              return buffer.unique_prefix .. buffer.filename
            end,
            style = function(buffer)
              return buffer.is_focused and "bold" or nil
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg1 or G.colors.bg0
            end,
          },
          {
            text = function(buffer)
              local errors = buffer.diagnostics.errors
              return (errors ~= 0 and " " .. G.signs.Error .. errors .. " ") or ""
            end,
            fg = function(buffer)
              local errors = buffer.diagnostics.errors
              return (errors ~= 0 and G.colors.red) or nil
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg1 or G.colors.bg0
            end,
          },
          {
            text = function(buffer)
              local warnings = buffer.diagnostics.warnings
              return (warnings ~= 0 and " " .. G.signs.Warn .. warnings .. " ") or ""
            end,
            fg = function(buffer)
              local warnings = buffer.diagnostics.warnings
              return (warnings ~= 0 and G.colors.yellow) or nil
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg1 or G.colors.bg0
            end,
          },
          {
            text = function(buffer)
              local infos = buffer.diagnostics.infos
              return (infos ~= 0 and " " .. G.signs.Info .. infos .. " ") or ""
            end,
            fg = function(buffer)
              local infos = buffer.diagnostics.infos
              return (infos ~= 0 and G.colors.blue) or nil
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg1 or G.colors.bg0
            end,
          },
          {
            text = function(buffer)
              local hints = buffer.diagnostics.hints
              return (hints ~= 0 and " " .. G.signs.Hint .. hints .. " ") or ""
            end,
            fg = function(buffer)
              local hints = buffer.diagnostics.hints
              return (hints ~= 0 and G.colors.green) or nil
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg1 or G.colors.bg0
            end,
          },
          {
            text = function(buffer)
              local modified = buffer.is_modified
              return modified and " " .. G.icons.file_modified or " " .. G.icons.close
            end,
            fg = function(buffer)
              local modified = buffer.is_modified
              local focused = buffer.is_focused
              return modified and G.colors.orange or focused and G.colors.fg1 or nil
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg1 or G.colors.bg0
            end,
            delete_buffer_on_left_click = true,
          },
          {
            text = function(buffer)
              if buffer.is_focused or buffer.is_last then
                return ""
              else
                return " "
              end
            end,
            fg = function(buffer)
              if buffer.is_focused then
                return G.colors.bg1
              elseif buffer.is_last then
                return G.colors.bg0
              end
            end,
            bg = function(buffer)
              if buffer.is_last then
                return G.colors.bg2
              else
                return G.colors.bg0
              end
            end,
          },
        },
        sidebar = {
          filetype = "NvimTree",
          components = {
            {
              text = "",
              fg = function(buffer)
                if buffer.is_focused then
                  return G.colors.bg1
                else
                  return G.colors.bg0
                end
              end,
            },
            {
              text = "NvimTree",
              style = "bold",
              bg = function(buffer)
                if buffer.is_focused then
                  return G.colors.bg1
                else
                  return G.colors.bg0
                end
              end,
            },
            {
              text = "",
              fg = function(buffer)
                if buffer.is_focused then
                  return G.colors.bg1
                else
                  return G.colors.bg0
                end
              end,
            },
          },
        },
      }
    end,
  },
}
