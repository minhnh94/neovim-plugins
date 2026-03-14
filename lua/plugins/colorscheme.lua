return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    flavour = "mocha",
    opts = {
      auto_integrations = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
