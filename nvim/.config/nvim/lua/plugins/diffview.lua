return {
  { -- diffView
    "sindrets/diffview.nvim",
    lazy = false,
    keys = {
      { "<leader>D<Tab>", "<cmd>DiffviewOpen<cr>", desc = "打开 Diffview 窗口" },
      { "<leader>Dd", "<cmd>DiffviewClose<cr>", desc = "关闭 Diffview" },
      { "<leader>De", "<cmd>DiffviewToggleFiles<cr>", desc = "切换文件面板" },
      { "<leader>Df", "<cmd>DiffviewFocusFiles<cr>", desc = "聚焦文件面板" },
      { "<leader>Dr", "<cmd>DiffviewRefresh<cr>", desc = "刷新 diff 统计" },
      { "<leader>Dh", "<cmd>DiffviewFileHistory<cr>", desc = "查看当前文件的历史" },
      { "<leader>DH", "<cmd>DiffviewFileHistory %<cr>", desc = "查看当前文件的历史（仅当前文件）" },
    },
  },
}
