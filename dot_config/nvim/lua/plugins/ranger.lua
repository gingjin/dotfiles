return {
  {
    "kelly-lin/ranger.nvim",
    keys = {
      {
        "<M-r>",
        function()
          require("ranger-nvim").open(true)
        end,
        desc = "Ranger",
        silent = true,
      },
    },
    opts = function()
      local ranger_nvim = require("ranger-nvim")
      return {
        enable_cmds = false,
        replace_netrw = false,
        keybinds = {
          ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
          ["oh"] = ranger_nvim.OPEN_MODE.split,
          ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
          ["or"] = ranger_nvim.OPEN_MODE.rifle,
        },
        ui = {
          border = "none",
          height = 1,
          width = 1,
          x = 0.5,
          y = 0.5,
        },
      }
    end,
  },
}
