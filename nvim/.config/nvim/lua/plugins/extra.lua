return {
  -- 启用 extras 模块
  { import = "lazyvim.plugins.extras.coding.blink" },
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "PmenuBorder" })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
      opts.completion = opts.completion or {}
      opts.completion.menu = { border = "rounded" }
      opts.completion.documentation = opts.completion.documentation or {}
      opts.completion.documentation.window = { border = "rounded" }
    end,
  },

  { import = "lazyvim.plugins.extras.dap.core" },

  { import = "lazyvim.plugins.extras.editor.fzf" },
  { import = "lazyvim.plugins.extras.editor.outline" },
  { import = "lazyvim.plugins.extras.editor.navic" },
  { import = "lazyvim.plugins.extras.editor.snacks_picker" },

  { import = "lazyvim.plugins.extras.ui.treesitter-context" },
}
