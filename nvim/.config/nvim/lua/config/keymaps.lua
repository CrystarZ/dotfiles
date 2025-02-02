-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local opt = { noremap = true, silent = true }
local function map(mode, l, r, desc)
  vim.keymap.set(mode, l, r, { noremap = true, silent = true, desc = desc })
end

--line number
map("n", "<F2>", ":set nu! nu?<CR>", "togle line number")

--JK
map({ "i", "v" }, "jk", "<ESC>", "JK")
map("t", "<ESC>", "<C-\\><C-n>", "esc teminal")
map("t", "<C-/>", "<C-\\><C-n>:bdelete! %<CR>", "close terminal")
map("t", "<C-_>", "<C-\\><C-n>:bdelete! %<CR>", "close terminal")

--Ctrl-A
map({ "n", "i", "v" }, "<leader>a", "<ESC>ggVG", "select all")

-- redo
map("n", "U", "<C-r>", "redo")
