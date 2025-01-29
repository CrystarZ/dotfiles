-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local opt = { noremap = true, silent = true }
local function map(mode, l, r, desc)
  vim.keymap.set(mode, l, r, { noremap = true, silent = true, desc = desc })
end

--fuction
map("n", "<F2>", ":set nu! nu?<CR>", "togle line number") --line number
--JK
map("i", "jk", "<ESC>", "JK")
map("v", "jk", "<ESC>", "JK")
map("t", "<ESC>", "<C-\\><C-n>", "esc teminal")
map("t", "<C-/>", "<C-\\><C-n>:bdelete! %<CR>", "close terminal")
map("t", "<C-_>", "<C-\\><C-n>:bdelete! %<CR>", "close terminal")

--ctrl-a
map("n", "<leader>a", "ggVG", "select all") --Ctrl-A
map("i", "<leader>a", "<ESC>ggVG", "select all")
map("v", "<leader>a", "<ESC>ggVG", "select all")

map("n", "U", "<C-r>", "redo") -- redo
