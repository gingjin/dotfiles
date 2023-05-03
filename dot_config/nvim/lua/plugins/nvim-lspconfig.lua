local servers = {
  "bashls",
  "clangd",
  "cmake",
  "lua_ls",
  "pyright",
  "rust_analyzer",
}

local tools = {
  dap = { "debugpy" },
  linter = { "cmakelint", "cpplint", "flake8" },
  formatter = { "clang-format", "rustfmt", "stylua", "yapf" },
}

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lspconfig.ui.windows").default_options.border = "double"
      for type, icon in pairs(require("G").signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      for _, server in ipairs(servers) do
        if server == "lua_ls" then
          require("extra.nvim-lspconfig.providers.lua_ls")
        else
          local M = require("extra.nvim-lspconfig.parameters")
          require("lspconfig")[server].setup({
            handlers = M.handlers,
            on_attach = M.on_attach,
            capabilities = M.capabilities,
          })
        end
      end
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
          ui = {
            icons = {
              package_pending = "",
              package_installed = "",
              package_uninstalled = "ﮊ",
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = servers,
          automatic_installation = true,
        },
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
        init = function()
          vim.api.nvim_create_autocmd("User", {
            pattern = "MasonToolsStartingInstall",
            callback = function()
              vim.schedule(function()
                vim.notify("mason-tool-installer is starting", "info", {
                  title = "Mason Tool Installer",
                })
              end)
            end,
          })
          vim.api.nvim_create_autocmd("User", {
            pattern = "MasonToolsUpdateCompleted",
            callback = function()
              vim.schedule(function()
                vim.notify("mason-tool-installer has finished", "info", {
                  title = "Mason Tool Installer",
                })
              end)
            end,
          })
        end,
        opts = {
          ensure_installed = { tools.dap, tools.linter, tools.formatter },
          auto_update = true,
        },
      },
    },
  },
}
