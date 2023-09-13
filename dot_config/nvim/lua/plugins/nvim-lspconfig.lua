return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
        opts = {
          github = {
            download_url_template = "https://ghproxy.com/https://github.com/%s/releases/download/%s/%s",
          },
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
        opts = function()
          local servers = require("G").servers
          return {
            ensure_installed = servers,
            automatic_installation = true,
            handlers = {
              function(server_name)
                local M = require("extra.nvim-lspconfig.parameters")
                require("lspconfig")[server_name].setup({
                  handlers = M.handlers,
                  on_attach = M.on_attach,
                  capabilities = M.capabilities,
                })
              end,
              ["lua_ls"] = function()
                local M = require("extra.nvim-lspconfig.parameters")
                require("lspconfig")["lua_ls"].setup({
                  handlers = M.handlers,
                  on_attach = M.on_attach,
                  capabilities = M.capabilities,
                  settings = {
                    Lua = {
                      diagnostics = {
                        globals = { "vim" },
                      },
                    },
                  },
                })
              end,
            },
          }
        end,
        config = function(_, opts)
          require("lspconfig.ui.windows").default_options.border = "double"
          require("mason-lspconfig").setup(opts)
        end,
      },
    },
  },
}
