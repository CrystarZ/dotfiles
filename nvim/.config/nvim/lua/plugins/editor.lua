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
  -- {
  --   "Bekaboo/dropbar.nvim",
  --   dependencies = {
  --     "nvim-telescope/telescope-fzf-native.nvim",
  --     build = "make",
  --   },
  --   config = function()
  --     local dropbar_api = require("dropbar.api")
  --     vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
  --     vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
  --     vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
  --   end,
  -- },
  { --! nvim-colorizer
    "norcalli/nvim-colorizer.lua",
    opts = { "*" },
  },
}
