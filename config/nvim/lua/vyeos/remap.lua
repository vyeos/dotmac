vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<C-n>", vim.cmd.Ex)

map("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "New Tab" })
map("n", "<S-l>", "gt", { desc = "Next Tab" })
map("n", "<S-h>", "gT", { desc = "Previous Tab" })

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "=ap", "ma=ap'a")

map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)

map("x", "J", ":move '>+1<CR>gv=gv", opts)
map("x", "K", ":move '<-2<CR>gv=gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)
