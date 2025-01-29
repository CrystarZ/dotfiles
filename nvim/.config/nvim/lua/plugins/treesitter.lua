return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true, additional_vim_regex_highlighting = true },
      vim.api.nvim_set_hl(0, "@lsp.mod.constructorOrDestructor.cpp", { link = "Function" }),
    },
  },
}
