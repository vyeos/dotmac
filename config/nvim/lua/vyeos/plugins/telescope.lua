return {
	"nvim-telescope/telescope.nvim",
	tag = "v0.1.9",
	dependencies = { "nvim-lua/plenary.nvim", "jvgrootveld/telescope-zoxide" },

	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
				},
				mappings = {
					i = {
						["<C-s>"] = actions.select_horizontal,
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live grep" })
		vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>")
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Git Files" })

		--   vim.keymap.set("n", "<leader>th", function()
		--     local theme = require("telescope.themes").get_dropdown({
		--       previewer = false,
		--       layout_config = {
		--         height = 0.8,
		--         width = 0.4,
		--         prompt_position = "top",
		--       },
		--     })
		--     require('telescope.builtin').colorscheme {
		--       enable_preview = true,
		--       theme = theme
		--     }
		-- end)

		telescope.load_extension("zoxide")
		vim.keymap.set("n", "<leader>z", telescope.extensions.zoxide.list)
	end,
}
