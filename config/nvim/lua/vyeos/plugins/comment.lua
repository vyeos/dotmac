return {
	"numToStr/Comment.nvim",
	opts = {},
	keys = {
		{
			"<leader>/",
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			mode = "n",
		},
		{ "<leader>/", "<Plug>(comment_toggle_linewise_visual)", mode = "v" },
	},
}
