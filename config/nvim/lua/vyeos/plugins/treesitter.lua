return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.config")

		config.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"typescript",
				"json",
				"c",
				"go",
				"zig",
				"rust",
			},

			sync_install = false,
			auto_install = true,
			ignore_install = {},
			modules = {},

			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
