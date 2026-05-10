return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  {
    "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },
  -- Configure LazyVim to load scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
