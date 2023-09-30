return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Breakpoint", silent = true },
      {
        "<leader>dB",
        "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        desc = "Breakpoint condition",
      },
      {
        "<leader>dl",
        "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        desc = "Log breakpoint message",
      },
    },
    init = function()
      local map = require("K").map
      map("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>", "Continue")
      map("n", "<F6>", "<Cmd>lua require'dap'.step_over()<CR>", "Step over")
      map("n", "<F7>", "<Cmd>lua require'dap'.step_into()<CR>", "Step into")
      map("n", "<F8>", "<Cmd>lua require'dap'.step_out()<CR>", "Step out")
      map("n", "<leader>dr", "<Cmd>lua require'dap'.restart()<CR>", "Restart")
      map("n", "<leader>dR", "<Cmd>lua require'dap'.repl.toggle()<CR>", "Repl")
      map("n", "<leader>dk", "<Cmd>lua require'dapui'.eval()<CR>", "Evaluate expression")
      map("n", "<leader>ds", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.scopes)
      end, "Scopes")
      map("n", "<leader>df", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
      end, "Frames")
    end,
    config = function()
      vim.cmd("au FileType dap-repl lua require('dap.ext.autocompl').attach()")

      local dap = require("dap")
      dap.defaults.fallback.external_terminal = true
      dap.defaults.fallback.focus_terminal = true

      -- c, cpp, rust
      local codelldb = require("extra.nvim-dap.adapter").codelldb
      dap.adapters.codelldb = codelldb.adapter
      dap.configurations.c = codelldb.config
      dap.configurations.cpp = codelldb.config
      dap.configurations.rust = codelldb.config

      -- python
      local debugpy = require("extra.nvim-dap.adapter").debugpy
      dap.adapters.python = debugpy.adapter
      dap.configurations.python = debugpy.config
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        opts = {
          icons = {
            expanded = "",
            collapsed = "",
            current_frame = "",
          },
          mappings = {
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          layouts = {
            {
              elements = {
                "scopes",
                "breakpoints",
                "stacks",
                "watches",
              },
              size = 25,
              position = "left",
            },
            {
              elements = {
                "repl",
                "console",
              },
              size = 10,
              position = "bottom",
            },
          },
          controls = {
            enabled = true,
            element = "repl",
            icons = {
              pause = "",
              play = "",
              step_into = "",
              step_over = "",
              step_out = "",
              step_back = "",
              run_last = "",
              terminate = "",
            },
          },
        },
        config = function(_, opts)
          require("dapui").setup(opts)
          local dap = require("dap")
          dap.listeners.after.event_initialized["dapui_config"] = function()
            require("dapui").open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            require("dapui").close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            require("dapui").close()
          end
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {
          enabled = true,
          enabled_commands = true,
          highlight_changed_variables = true,
          highlight_new_as_changed = false,
          show_stop_reason = true,
          commented = true,
          only_first_definition = true,
          all_references = false,
          filter_references_pattern = "<module",
          virt_text_pos = "eol",
          all_frames = false,
          virt_lines = false,
          virt_text_win_col = nil,
        },
      },
    },
  },
}
