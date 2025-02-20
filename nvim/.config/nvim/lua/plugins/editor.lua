return {
  { --! vim-tmux-navigator
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>" },
      { "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>" },
      { "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>" },
      { "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>" },
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      attach_navic = true, -- 自动附加到 navic
      create_autocmd = true,
    },
  },
}
