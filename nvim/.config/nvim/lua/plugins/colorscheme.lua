return {
  {
    dir = os.getenv("_themes_") .. "/nvim",
    name = "oneiroi",
    priority = 1000,
    lazy = false,
    opts = {
      style = "dream",
      transparent = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oneiroi",
    },
  },
}
