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

      local M = require("extra.lsp.parameters")
      for _, server in ipairs(servers) do
        if server == "lua_ls" then
          require("extra.lsp.providers.lua_ls")
        else
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
        build = ":MasonUpdate",
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
