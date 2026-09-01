return {
  {
    dir = os.getenv("_themes_") .. "/nvim",
    name = "oneiroi",
    priority = 1000,
    lazy = false,
    opts = {
      style = "melatonin",
      transparent = true,
      no_ui = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    enabled = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oneiroi-melatonin",
      colors = { "base" },
    },
  },
}
