return {
  { -- diffView
    "sindrets/diffview.nvim",
    lazy = true,
    keys = {
      { "<leader>D", "", desc = "+diff" },
      { "<leader>Do", ":DiffviewOpen<cr>", desc = "Open diffView tab" },
      { "<leader>Dc", ":DiffviewClose<cr>", desc = "Close diffView tab" },
      { "<leader>Dt", ":DiffviewToggleFiles<cr>", desc = "Toggle the file panel" },
      { "<leader>Df", ":DiffviewFocusFiles<cr>", desc = "Bring focus to the file panel" },
      { "<leader>Dr", ":DiffviewRefresh<cr>", desc = "Update stats" },
      { "<leader>Dh", ":DiffviewFileHistory<cr>", desc = "Opens a new file history view" },
    },
  },
  { --lazygit(Do not use gitui)
    "LazyVim/LazyVim",
    keys = {
      {
        "<leader>gG",
        function()
          vim.cmd("tabnew | term lazygit")
          vim.cmd("startinsert")
        end,
        desc = "GitUi (cwd)",
      },
      {
        "<leader>gg",
        function()
          local cwd = vim.fn.getcwd()
          vim.cmd("tabnew | term lazygit -w " .. cwd)
          vim.cmd("startinsert")
        end,
        desc = "GitUi (Root Dir)",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
    keys = {
      {
        mode = "n",
        "]h",
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            vim.cmd.normal("Gitsigns nav_hunk next")
          end
        end,
        desc = "Next Hunk",
      },
      {
        mode = "n",
        "[h",
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            vim.cmd.normal("Gitsigns nav_hunk prev")
          end
        end,
        desc = "Prev Hunk",
      },
      { mode = "n", "]H", ":Gitsigns nav_hunk last<CR>", desc = "Last Hunk" },
      { mode = "n", "[H", ":Gitsigns nav_hunk first<CR>", desc = "First Hunk" },
      { mode = { "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
      { mode = { "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
      { mode = "n", "<leader>ghS", ":Gitsigns stage_buffer<CR>", desc = "Stage Buffer" },
      { mode = "n", "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },
      { mode = "n", "<leader>ghR", ":Gitsigns reset_buffer<CR>", desc = "Reset Buffer" },
      { mode = "n", "<leader>ghp", ":Gitsigns preview_hunk_inline<CR>", desc = "Preview Hunk Inline" },
      { mode = "n", "<leader>ghb", ":Gitsigns blame_line<CR>", desc = "Blame Line" },
      { mode = "n", "<leader>ghB", ":Gitsigns blame<CR>", desc = "Blame Buffer" },
      { mode = "n", "<leader>ghd", ":Gitsigns diffthis<CR>", desc = "Diff This" },
      { mode = "n", "<leader>ghD", ":Gitsigns diffthis ~<CR>", desc = "Diff This ~" },
      { mode = { "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "GitSigns Select Hunk" },
      { mode = "n", "<leader>ghl", ":Gitsigns toggle_current_line_blame<CR>", desc = "toggle current line blame" },
    },
  },
}
