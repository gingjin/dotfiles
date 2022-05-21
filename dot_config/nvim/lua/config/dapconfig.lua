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
dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.getenv("HOME") .. "/.config/nvim/adapters/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		miDebuggerPath = "/usr/bin/gdb", -- Adjust to where gdb is installed
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- go
dap.adapters.go = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.config/nvim/adapters/vscode-go/dist/debugAdapter.js" },
}
dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		showLog = false,
		program = "${file}",
		dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
	},
}

-- python
dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" }, -- Adjust to where debugpy is installed
}
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			local cwd = vim.fn.getcwd()
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			else
				return "/usr/bin/python"
			end
		end,
	},
}

local api = vim.api
local keymap_restore = {}
dap.listeners.after["event_initialized"]["me"] = function()
	for _, buf in pairs(api.nvim_list_bufs()) do
		local keymaps = api.nvim_buf_get_keymap(buf, "n")
		for _, keymap in pairs(keymaps) do
			if keymap.lhs == "<M-K>" then
				table.insert(keymap_restore, keymap)
				api.nvim_buf_del_keymap(buf, "n", "<M-K>")
			end
		end
	end
	api.nvim_set_keymap("n", "<M-K>", ':lua require("dap.ui.widgets").hover()<cr>', { silent = true })
end

dap.listeners.after["event_terminated"]["me"] = function()
	for _, keymap in pairs(keymap_restore) do
		api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
	end
	keymap_restore = {}
end
