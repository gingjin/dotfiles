-- nvim aerial
--
require("aerial").setup({
  lsp = {
    diagnostics_trigger_update = true,
    update_when_errors = true,
    update_delay = 300,
  },
  treesitter = { update_delay = 300 },
  filter_kind = false,
  on_attach = function(bufnr)
    local function bufmap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    require("keymaps").aerial(bufmap)
  end,
  close_behavior = "close",
  nerd_font = true,
  highlight_on_hover = true,
})

local cmd = vim.cmd
cmd("hi link AerialClass Type")
cmd("hi link AerialClassIcon Special")
cmd("hi link AerialFunction Special")
cmd("hi AerialFunctionIcon guifg=#cb4b16 guibg=NONE guisp=NONE gui=NONE cterm=NONE")
