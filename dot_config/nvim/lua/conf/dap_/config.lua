-- nvim dap
--
local dap = require("dap")
dap.defaults.fallback.external_terminal = true
dap.defaults.fallback.focus_terminal = true

vim.cmd("au FileType dap-repl lua require('dap.ext.autocompl').attach()")

local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "", texthl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "", texthl = "", numhl = "" })
sign("DapLogPoint", { text = "", texthl = "", numhl = "" })
sign("DapStopped", { text = "", texthl = "", numhl = "" })
sign("DapBreakpointRejected", { text = "", texthl = "", numhl = "" })

-- c/c++/rust
dap.adapters.cppdbg = require("conf.dap_.adapters").cpp.cppdbg
dap.configurations.cpp = require("conf.dap_.adapters").cpp.config
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- go
dap.adapters.go = require("conf.dap_.adapters").go.go
dap.configurations.go = require("conf.dap_.adapters").go.config

-- python
-- local venv = os.getenv("VIRTUAL_ENV")
-- local command = vim.fn.getcwd() .. string.format("%s/bin/python", venv)
dap.adapters.python = require("conf.dap_.adapters").python.python
dap.configurations.python = require("conf.dap_.adapters").python.config
