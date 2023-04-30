local servers = {
  "bashls",
  "clangd",
  "cmake",
  "lua_ls",
  "pyright",
  "rust_analyzer",
}

return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
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
    },
  },
}
