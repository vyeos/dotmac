return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { silent = true } },
		{ "<c-j>", "<cmd>TmuxNavigateDown<cr>", { silent = true } },
		{ "<c-k>", "<cmd>TmuxNavigateUp<cr>", { silent = true } },
		{ "<c-l>", "<cmd>TmuxNavigateRight<cr>", { silent = true } },
		{ "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { silent = true } },
	},
}
