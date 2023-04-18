local M = require("extra.nvim-notify.progress_updates")
local L = {}

function L.lsp_status()
  vim.lsp.handlers["$/progress"] = function(_, result, ctx)
    local client_id = ctx.client_id
    local val = result.value

    if not val.kind then
      return
    end

    local notif_data = M.get_notif_data(client_id, result.token)

    if val.kind == "begin" then
      local message = M.format_message(val.message, val.percentage)

      notif_data.notification = vim.notify(message, "info", {
        title = M.format_title(val.title, vim.lsp.get_client_by_id(client_id).name),
        icon = M.spinner_frames[1],
        timeout = false,
        hide_from_history = false,
      })

      notif_data.spinner = 1
      M.update_spinner(client_id, result.token)
    elseif val.kind == "report" and notif_data then
      notif_data.notification = vim.notify(M.format_message(val.message, val.percentage), "info", {
        replace = notif_data.notification,
        hide_from_history = false,
      })
    elseif val.kind == "end" and notif_data then
      notif_data.notification = vim.notify(val.message and M.format_message(val.message) or "Complete", "info", {
        icon = "",
        replace = notif_data.notification,
        timeout = 3000,
      })

      notif_data.spinner = nil
    end
  end
end

return L
