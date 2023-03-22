vim.cmd("au FileType dap-repl lua require('dap.ext.autocompl').attach()")

local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "➤", texthl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "➤", texthl = "", numhl = "" })
sign("DapLogPoint", { text = "➤", texthl = "", numhl = "" })
sign("DapStopped", { text = "", texthl = "", numhl = "" })
sign("DapBreakpointRejected", { text = "➤", texthl = "", numhl = "" })

local dap = require("dap")
dap.defaults.fallback.external_terminal = true
dap.defaults.fallback.focus_terminal = true

-- c/c++/rust
dap.adapters.cppdbg = require("plugins.dap_.adapter").cpp.adapter
dap.configurations.cpp = require("plugins.dap_.adapter").cpp.config
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- go
-- dap.adapters.go = require("plugins.dap_.adapter").go.adapter
-- dap.configurations.go = require("plugins.dap_.adapter").go.config

-- python
dap.adapters.python = require("plugins.dap_.adapter").python.adapter
dap.configurations.python = require("plugins.dap_.adapter").python.config

local G = require("G")
G.map({
  { "n", "<F5>", ":lua require'dap'.continue()<CR>" },
  { "n", "<F6>", ":lua require'dap'.step_over()<CR>" },
  { "n", "<F7>", ":lua require'dap'.step_into()<CR>" },
  { "n", "<F8>", ":lua require'dap'.step_out()<CR>" },
  { "n", "<leader>dt", ":lua require'dap'.toggle_breakpoint()<CR>" },
  { "n", "<leader>ds", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },
  { "n", "<leader>dp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" },
  { "n", "<leader>dr", ":lua require'dap'.repl.toggle()<CR>" },
  { "n", "<leader>dl", ":lua require'dap'.run_last()<CR>" },
})
