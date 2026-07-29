-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Comment Line" })
map("x", "<leader>/", "gc", { remap = true, desc = "Toggle Comment Selection" })

map("n", "<C-n>", function()
  Snacks.explorer({ cwd = LazyVim.root() })
end, { desc = "Focus File Explorer" })

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "=ap", "ma=ap'a")
map("x", "J", ":move '>+1<cr>gv=gv")
map("n", "J", "", { remap = true, desc = "Removing this feature" })
map("x", "K", ":move '<-2<cr>gv=gv")
