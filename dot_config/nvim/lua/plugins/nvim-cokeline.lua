return {
  {
    "willothy/nvim-cokeline",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    init = function()
      local map = require("K").map
      map("n", "<leader>bn", "<Plug>(cokeline-focus-next)", "Goto next buffer")
      map("n", "<leader>bp", "<Plug>(cokeline-focus-prev)", "Goto previous buffer")
      map("n", "<leader>bc", "<Plug>(cokeline-pick-close)", "Pick a buffer to close")
      map("n", "<leader>bf", "<Plug>(cokeline-pick-focus)", "Pick a buffer to focus")
    end,
    opts = function()
      local colors = require("G").colors
      local icons = require("G").icons
      -- local signs = require("G").signs
      local is_picking_focus = require("cokeline.mappings").is_picking_focus
      local is_picking_close = require("cokeline.mappings").is_picking_close
      return {
        default_hl = {
          fg = function(buffer)
            return buffer.is_focused and colors.fg1 or colors.fg2
          end,
          bg = colors.bg3,
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
              return focused and colors.bg2 or first and colors.bg1
            end,
            bg = function(buffer)
              return buffer.is_first and colors.bg3 or colors.bg1
            end,
          },
          {
            text = function(buffer)
              local picking = is_picking_focus() or is_picking_close()
              return picking and buffer.pick_letter .. " " or buffer.devicon.icon
            end,
            bold = true,
            fg = function(buffer)
              return (is_picking_focus() and colors.orange)
                or (is_picking_close() and colors.red)
                or (buffer.is_focused and buffer.devicon.color)
            end,
            bg = function(buffer)
              return buffer.is_focused and colors.bg2 or colors.bg1
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
              return buffer.is_focused and colors.bg2 or colors.bg1
            end,
          },
          -- {
          --   text = function(buffer)
          --     local errors = buffer.diagnostics.errors
          --     return (errors ~= 0 and " " .. signs.Error .. " " .. errors) or ""
          --   end,
          --   fg = function(buffer)
          --     local errors = buffer.diagnostics.errors
          --     return errors ~= 0 and colors.red
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and colors.bg2 or colors.bg1
          --   end,
          -- },
          -- {
          --   text = function(buffer)
          --     local warnings = buffer.diagnostics.warnings
          --     return (warnings ~= 0 and " " .. signs.Warn .. " " .. warnings) or ""
          --   end,
          --   fg = function(buffer)
          --     local warnings = buffer.diagnostics.warnings
          --     return warnings ~= 0 and colors.yellow
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and colors.bg2 or colors.bg1
          --   end,
          -- },
          -- {
          --   text = function(buffer)
          --     local infos = buffer.diagnostics.infos
          --     return (infos ~= 0 and " " .. signs.Info .. " " .. infos) or ""
          --   end,
          --   fg = function(buffer)
          --     local infos = buffer.diagnostics.infos
          --     return infos ~= 0 and colors.green
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and colors.bg2 or colors.bg1
          --   end,
          -- },
          -- {
          --   text = function(buffer)
          --     local hints = buffer.diagnostics.hints
          --     return (hints ~= 0 and " " .. signs.Hint .. " " .. hints) or ""
          --   end,
          --   fg = function(buffer)
          --     local hints = buffer.diagnostics.hints
          --     return hints ~= 0 and colors.blue
          --   end,
          --   bg = function(buffer)
          --     return buffer.is_focused and colors.bg2 or colors.bg1
          --   end,
          -- },
          {
            text = function(buffer)
              local modified = buffer.is_modified
              return modified and " " .. icons.file_modified or " " .. icons.close
            end,
            fg = function(buffer)
              local modified = buffer.is_modified
              local focused = buffer.is_focused
              return modified and colors.orange or focused and colors.fg1
            end,
            bg = function(buffer)
              return buffer.is_focused and colors.bg2 or colors.bg1
            end,
            delete_buffer_on_left_click = true,
          },
          {
            text = function(buffer)
              return (buffer.is_focused or buffer.is_last) and "" or " "
            end,
            fg = function(buffer)
              return buffer.is_focused and colors.bg2 or colors.bg1
            end,
            bg = function(buffer)
              return buffer.is_last and colors.bg3 or colors.bg1
            end,
          },
        },
        sidebar = {
          filetype = { "NvimTree" },
          components = {
            {
              text = "",
              fg = function(buffer)
                return buffer.is_focused and colors.bg2 or colors.bg1
              end,
            },
            {
              text = function(buf)
                return vim.bo[buf.number].filetype
              end,
              bold = function(buffer)
                return buffer.is_focused
              end,
              bg = function(buffer)
                return buffer.is_focused and colors.bg2 or colors.bg1
              end,
            },
            {
              text = "",
              fg = function(buffer)
                return buffer.is_focused and colors.bg2 or colors.bg1
              end,
            },
          },
        },
      }
    end,
  },
}
