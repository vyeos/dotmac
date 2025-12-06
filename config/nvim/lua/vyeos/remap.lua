local M = {}

vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<C-n>", vim.cmd.Ex)
map("n", "<leader>t", "<cmd>tabnew<CR>", { desc = "New Tab" })
map("n", "<Tab>", "gt", { desc = "Next Tab" })
map("n", "<S-Tab>", "gT", { desc = "Previous Tab" })
map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy whole file" })

M.general = {
	i = {},

	n = {
		["<C-u>"] = { "<C-u>zz" },
		["<C-d>"] = { "<C-d>zz" },
		["n"] = { "nzzzv" },
		["N"] = { "Nzzzv" },
		["=ap"] = { "ma=ap'a" },
	},
	v = {},
	x = {},
}

return M
