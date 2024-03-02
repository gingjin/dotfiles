return {
  {
    "nvim-neorg/neorg",
    cmd = "Neorg",
    ft = { "norg" },
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.export"] = {},
          ["core.summary"] = {},
          ["core.qol.toc"] = {
            config = { close_after_use = true },
          },
          ["core.completion"] = {
            config = { engine = "nvim-cmp" },
          },
          ["core.presenter"] = {
            config = { zen_mode = "zen-mode" },
          },
          ["core.dirman"] = {
            config = {
              index = "new.norg",
              workspaces = {
                notes = "~/neorg/notes",
                works = "~/neorg/works",
              },
            },
          },
        },
      })
    end,
  },
}
