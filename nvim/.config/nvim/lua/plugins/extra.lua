return {
  -- 启用 extras 模块
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.ui.treesitter-context" },
  { import = "lazyvim.plugins.extras.ui.smear-cursor" },
  -- { import = "lazyvim.plugins.extras.ui.edgy" },
  --LANG
  { import = "lazyvim.plugins.extras.lang.git" },
  { import = "lazyvim.plugins.extras.lang.clangd" },
  { import = "lazyvim.plugins.extras.lang.cmake" },
  { import = "lazyvim.plugins.extras.lang.json" },
}
