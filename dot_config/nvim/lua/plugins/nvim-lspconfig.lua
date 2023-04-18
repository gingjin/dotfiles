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
    init = function()
      local G = require("G")
      for type, icon in pairs(G.signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end
    end,
    config = function()
      require("lspconfig.ui.windows").default_options.border = "double"

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
        opts = function()
          return {
            ui = {
              icons = {
                package_pending = "",
                package_installed = "",
                package_uninstalled = "ﮊ",
              },
            },
          }
        end,
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = function()
          return {
            ensure_installed = servers,
            automatic_installation = true,
          }
        end,
      },
    },
  },
}
