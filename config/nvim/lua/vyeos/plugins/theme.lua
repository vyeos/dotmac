return {
	{
		"neanias/everforest-nvim",
		priority = 1000,
		config = function()
			require("everforest").setup({
				-- Optional: Add Everforest specific config here
				background = "hard",
			})
		end,
	},
	{
		"marko-cerovac/material.nvim",
		priority = 1000,
		config = function()
			-- Set the specific style (options: 'darker', 'lighter', 'oceanic', 'palenight', 'deep ocean')
			vim.g.material_style = "darker"

			require("material").setup({
				contrast = {
					terminal = false,
					sidebars = false,
					floating_windows = false,
					cursor_line = false,
					non_current_windows = false,
					filetypes = {},
				},
				plugins = {
					"gitsigns",
					"nvim-cmp",
					"telescope",
				},
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = false,
				bold = true,
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = false,
				},
				strikethrough = true,
				inverse = true,
				contrast = "",
				dim_inactive = false,
				transparent_mode = false,
			})

			local theme_cache = vim.fn.stdpath("data") .. "/last_theme"

			_G.Theme = function(name)
				vim.cmd.colorscheme(name)
				local file = io.open(theme_cache, "w")
				if file then
					file:write(name)
					file:close()
					print("Default theme updated to: " .. name)
				end
			end

			vim.api.nvim_create_user_command("Theme", function(args)
				_G.Theme(args.args)
			end, {
				nargs = 1,
				complete = "color",
			})

			-- Startup Logic
			local file = io.open(theme_cache, "r")
			if file then
				local saved_theme = file:read("*all")
				file:close()
				-- Try to load saved theme, fallback to rose-pine if it fails
				if not pcall(vim.cmd.colorscheme, saved_theme) then
					vim.cmd.colorscheme("rose-pine")
				end
			else
				-- If no file exists (first run), use rose-pine
				vim.cmd.colorscheme("rose-pine")
			end
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "auto", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				-- NOTE: Highlight groups are extended (merged) by default. Disable this
				-- per group via `inherit = false`
				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- StatusLine = { fg = "love", bg = "love", blend = 15 },
					-- VertSplit = { fg = "muted", bg = "muted" },
					-- Visual = { fg = "base", bg = "text", inherit = false },
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
