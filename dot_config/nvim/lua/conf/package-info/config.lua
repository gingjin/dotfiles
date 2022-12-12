-- nvim package-info
--
require("package-info").setup({
  colors = {
    up_to_date = "#3C4048",
    outdated = "#d19a66",
  },
  icons = {
    enable = true,
    style = {
      up_to_date = "|  ",
      outdated = "|  ",
    },
  },
  autostart = true,
  hide_up_to_date = true,
  hide_unstable_versions = false,
  package_manager = "npm", -- 'npm', 'yarn' or 'pnpm'
})
