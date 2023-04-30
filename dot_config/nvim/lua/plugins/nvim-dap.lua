return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", desc = "Breakpoint", silent = true },
      {
        "<leader>dB",
        ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        desc = "Breakpoint condition",
      },
      {
        "<leader>dl",
        ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        desc = "Log breakpoint message",
      },
    },
    config = function()
      require("G").map({
        { "n", "<F5>", ":lua require'dap'.continue()<CR>", "Continue" },
        { "n", "<F6>", ":lua require'dap'.step_over()<CR>", "Step over" },
        { "n", "<F7>", ":lua require'dap'.step_into()<CR>", "Step into" },
        { "n", "<F8>", ":lua require'dap'.step_out()<CR>", "Step out" },
        { "n", "<leader>dr", ":lua require'dap'.restart()<CR>", "Restart" },
        { "n", "<leader>dR", ":lua require'dap'.repl.toggle()<CR>", "Repl" },
        { "n", "<leader>dk", ":lua require'dapui'.eval()<CR>", "Evaluate expression" },
        {
          "n",
          "<leader>ds",
          function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.scopes)
          end,
          "Scopes",
        },
        {
          "n",
          "<leader>df",
          function()
            local widgets = require("dap.ui.widgets")
            widgets.centered_float(widgets.frames)
          end,
          "Frames",
        },
      })

      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "➤", texthl = "", numhl = "" })
      sign("DapBreakpointCondition", { text = "➤", texthl = "", numhl = "" })
      sign("DapLogPoint", { text = "➤", texthl = "", numhl = "" })
      sign("DapStopped", { text = "", texthl = "", numhl = "" })
      sign("DapBreakpointRejected", { text = "➤", texthl = "", numhl = "" })
      vim.cmd("au FileType dap-repl lua require('dap.ext.autocompl').attach()")

      local dap = require("dap")
      dap.defaults.fallback.external_terminal = true
      dap.defaults.fallback.focus_terminal = true

      -- python
      local M = require("extra.nvim-dap.adapter")
      dap.adapters.python = M.python.adapter
      dap.configurations.python = M.python.config
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
          local dap = require("dap")
          require("dapui").setup(opts)
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
