return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dt", ":lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint", silent = true },
      {
        "<leader>dc",
        ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        desc = "Breakpoint Condition",
      },
      {
        "<leader>dm",
        ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        desc = "Log Point Message",
      },
    },
    init = function()
      local G = require("G")
      G.map({
        { "n", "<F5>", ":lua require'dap'.continue()<CR>", "Continue" },
        { "n", "<F6>", ":lua require'dap'.step_over()<CR>", "Step Over" },
        { "n", "<F7>", ":lua require'dap'.step_into()<CR>", "Step Into" },
        { "n", "<F8>", ":lua require'dap'.step_out()<CR>", "Step Out" },
        { "n", "<leader>dr", ":lua require'dap'.repl_toggle()<CR>", "Toggle Repl" },
        { "n", "<leader>dR", ":lua require'dap'.run_last()<CR>", "Run Last" },
        { "n", "<leader>dk", ":lua require'dapui'.eval()<CR>", "Eval" },
      })

      local sign = vim.fn.sign_define
      sign("DapBreakpoint", { text = "➤", texthl = "", numhl = "" })
      sign("DapBreakpointCondition", { text = "➤", texthl = "", numhl = "" })
      sign("DapLogPoint", { text = "➤", texthl = "", numhl = "" })
      sign("DapStopped", { text = "", texthl = "", numhl = "" })
      sign("DapBreakpointRejected", { text = "➤", texthl = "", numhl = "" })
    end,
    config = function()
      vim.cmd("au FileType dap-repl lua require('dap.ext.autocompl').attach()")

      local dap = require("dap")
      dap.defaults.fallback.external_terminal = true
      dap.defaults.fallback.focus_terminal = true

      -- c/c++/rust
      dap.adapters.cppdbg = require("extra.nvim-dap.adapter").cpp.adapter
      dap.configurations.cpp = require("extra.nvim-dap.adapter").cpp.config
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      -- python
      dap.adapters.python = require("extra.nvim-dap.adapter").python.adapter
      dap.configurations.python = require("extra.nvim-dap.adapter").python.config
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        opts = function()
          return {
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
                  { id = "scopes", size = 0.25 },
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
          }
        end,
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
        opts = function()
          return {
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            show_stop_reason = false,
            commented = true,
            only_first_definition = true,
            all_references = false,
            filter_references_pattern = "<module",
            virt_text_pos = "eol",
            all_frames = false,
            virt_lines = false,
            virt_text_win_col = nil,
          }
        end,
      },
    },
  },
}
