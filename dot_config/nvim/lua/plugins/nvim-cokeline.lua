return {
  {
    "willothy/nvim-cokeline",
    init = function()
      require("G").map({
        { "n", "<leader>bn", "<Plug>(cokeline-focus-next)", "Goto next buffer" },
        { "n", "<leader>bp", "<Plug>(cokeline-focus-prev)", "Goto previous buffer" },
        { "n", "<leader>bc", "<Plug>(cokeline-pick-close)", "Pick a buffer to close" },
        { "n", "<leader>bf", "<Plug>(cokeline-pick-focus)", "Pick a buffer to focus" },
      })
    end,
    opts = function()
      local G = require("G")
      local is_picking_focus = require("cokeline/mappings").is_picking_focus
      local is_picking_close = require("cokeline/mappings").is_picking_close
      return {
        default_hl = {
          fg = function(buffer)
            return buffer.is_focused and G.colors.fg1 or G.colors.fg2
          end,
          bg = G.colors.bg3,
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
              local focused = buffer.is_focused
              local first = buffer.is_first
              return focused and G.colors.bg2 or first and G.colors.bg1
            end,
            bg = function(buffer)
              return buffer.is_first and G.colors.bg3 or G.colors.bg1
            end,
          },
          {
            text = function(buffer)
              local picking = is_picking_focus() or is_picking_close()
              return picking and buffer.pick_letter .. " " or buffer.devicon.icon
            end,
            bold = function(buffer)
              return buffer.is_focused
            end,
            fg = function(buffer)
              return (is_picking_focus() and G.colors.orange)
                or (is_picking_close() and G.colors.red)
                or (buffer.is_focused and buffer.devicon.color)
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg2 or G.colors.bg1
            end,
          },
          {
            text = function(buffer)
              return buffer.unique_prefix .. buffer.filename
            end,
            bold = function(buffer)
              return buffer.is_focused
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg2 or G.colors.bg1
            end,
          },
          -- {
          --   text = function(buffer)
          --     local errors = buffer.diagnostics.errors
          --     return (errors ~= 0 and " " .. G.signs.Error .. " " .. errors) or ""
          --   end,
          --   fg = function(buffer)
          --     local errors = buffer.diagnostics.errors
          --     return errors ~= 0 and G.colors.red
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and G.colors.bg2 or G.colors.bg1
          --   end,
          -- },
          -- {
          --   text = function(buffer)
          --     local warnings = buffer.diagnostics.warnings
          --     return (warnings ~= 0 and " " .. G.signs.Warn .. " " .. warnings) or ""
          --   end,
          --   fg = function(buffer)
          --     local warnings = buffer.diagnostics.warnings
          --     return warnings ~= 0 and G.colors.yellow
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and G.colors.bg2 or G.colors.bg1
          --   end,
          -- },
          -- {
          --   text = function(buffer)
          --     local infos = buffer.diagnostics.infos
          --     return (infos ~= 0 and " " .. G.signs.Info .. " " .. infos) or ""
          --   end,
          --   fg = function(buffer)
          --     local infos = buffer.diagnostics.infos
          --     return infos ~= 0 and G.colors.blue
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and G.colors.bg2 or G.colors.bg1
          --   end,
          -- },
          -- {
          --   text = function(buffer)
          --     local hints = buffer.diagnostics.hints
          --     return (hints ~= 0 and " " .. G.signs.Hint .. " " .. hints) or ""
          --   end,
          --   fg = function(buffer)
          --     local hints = buffer.diagnostics.hints
          --     return hints ~= 0 and G.colors.green
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and G.colors.bg2 or G.colors.bg1
          --   end,
          -- },
          {
            text = function(buffer)
              local modified = buffer.is_modified
              return modified and " " .. G.icons.file_modified or " " .. G.icons.close
            end,
            fg = function(buffer)
              local modified = buffer.is_modified
              local focused = buffer.is_focused
              return modified and G.colors.orange or focused and G.colors.fg1
            end,
            bg = function(buffer)
              return buffer.is_focused and G.colors.bg2 or G.colors.bg1
            end,
            delete_buffer_on_left_click = true,
          },
          {
            text = function(buffer)
              return (buffer.is_focused or buffer.is_last) and "" or " "
            end,
            fg = function(buffer)
              return buffer.is_focused and G.colors.bg2 or G.colors.bg1
            end,
            bg = function(buffer)
              return buffer.is_last and G.colors.bg3 or G.colors.bg1
            end,
          },
        },
        sidebar = {
          filetype = "NvimTree",
          components = {
            {
              text = "",
              fg = function(buffer)
                return buffer.is_focused and G.colors.bg2 or G.colors.bg1
              end,
              bg = function(buffer)
                return buffer.is_focused and G.colors.bg3 or G.colors.bg1
              end,
            },
            {
              text = "NvimTree",
              bold = function(buffer)
                return buffer.is_focused
              end,
              bg = function(buffer)
                return buffer.is_focused and G.colors.bg2 or G.colors.bg1
              end,
            },
            {
              text = "",
              fg = function(buffer)
                return buffer.is_focused and G.colors.bg2 or G.colors.bg1
              end,
              bg = function(buffer)
                return buffer.is_focused and G.colors.bg3 or G.colors.bg1
              end,
            },
          },
        },
      }
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
