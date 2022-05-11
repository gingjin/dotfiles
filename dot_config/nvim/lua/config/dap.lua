-- nvim dap

local dap = require("dap")
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dapui.setup({
	icons = { expanded = "", collapsed = "" },
	mappings = {
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	sidebar = {
		elements = {
			{ id = "scopes", size = 0.25 },
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 0.25 },
		},
		size = 30,
		position = "left",
	},
	tray = {
		elements = { "repl" },
		size = 10,
		position = "bottom",
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "double",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
	},
})

require("nvim-dap-virtual-text").setup({
	enabled = true,
	enabled_commands = true,
	highlight_changed_variables = true,
	highlight_new_as_changed = false,
	show_stop_reason = false,
	commented = false,
	virt_text_pos = "eol",
	all_frames = true,
	virt_lines = false,
	virt_text_win_col = nil,
})

dap.defaults.fallback.external_terminal = true
dap.defaults.fallback.focus_terminal = true
vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", numhl = "" })

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
		miDebuggerPath = "/usr/bin/gdb",
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
		-- pythonPath = function()
		-- 	local cwd = vim.fn.getcwd()
		-- 	if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
		-- 		return cwd .. "/venv/bin/python"
		-- 	elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		-- 		return cwd .. "/.venv/bin/python"
		-- 	else
		-- 		return "/usr/bin/python"
		-- 	end
		-- end,
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
	api.nvim_set_keymap("n", "<M-K>", ':lua require("dap.ui.widgets").hover()<CR>', { silent = true })
end

dap.listeners.after["event_terminated"]["me"] = function()
	for _, keymap in pairs(keymap_restore) do
		api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
	end
	keymap_restore = {}
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<F5>", [[:lua require'dap'.continue()<cr>]], opts)
map("n", "<F6>", [[:lua require'dap'.step_over()<cr>]], opts)
map("n", "<F7>", [[:lua require'dap'.step_into()<cr>]], opts)
map("n", "<F8>", [[:lua require'dap'.step_out()<cr>]], opts)
map("n", "<leader>b", [[:lua require'dap'.toggle_breakpoint()<cr>]], opts)
map("n", "<leader>B", [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>]], opts)
map("n", "<leader>lp", [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>]], opts)
map("n", "<leader>dr", [[:lua require'dap'.repl.toggle()<cr>]], opts)
map("n", "<leader>dl", [[:lua require'dap'.run_last()<cr>]], opts)
