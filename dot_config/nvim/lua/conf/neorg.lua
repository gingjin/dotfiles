-- nvim neorg
--
require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.norg.qol.toc"] = {},
    ["core.norg.journal"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.manoeuvre"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/notes/work",
          home = "~/notes/home",
        },
      },
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "work",
      }
    },
    ["core.gtd.ui"] = {},
    ["core.gtd.helpers"] = {},
    ["core.gtd.queries"] = {},
    ["core.export"] = {},
    ["core.export.markdown"] = {},
    ["core.integrations.nvim-cmp"] = {},
    ["core.scanner"] = {},
    ["core.integrations.telescope"] = {},
    ["external.kanban"] = {},
  },
})

local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  keybinds.map_event_to_mode("norg", {
    n = {
      { "<C-s>", "core.integrations.telescope.find_linkable" },
    },
    i = {
      { "<C-l>", "core.integrations.telescope.insert_link" },
    },
  }, {
    silent = true,
    noremap = true,
  })
end)
