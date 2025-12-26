return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{
			"<leader>on",
			function()
				local obsidian = require("obsidian")
				local client = obsidian.get_client()

				vim.ui.input({ prompt = "Enter name for new note: " }, function(title)
					if not title or title == "" then
						return
					end

					local target_dir

					if vim.api.nvim_buf_get_name(0) == "" then
						target_dir = client.dir
					else
						target_dir = vim.fn.expand("%:p:h")
					end

					local note = client:create_note({
						title = title,
						dir = target_dir,
					})

					client:open_note(note)

					vim.schedule(function()
						vim.cmd("ObsidianTemplate")
					end)
				end)
			end,
			desc = "Create New Note with Template",
		},
		{ "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Today's Obsidian Note" },
		{ "<leader>ot", "<cmd>ObsidianTemplate<cr>", desc = "Insert Obsidian Template" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian Notes" },
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/personal/vault",
			},
		},

		-- 1. Daily Notes Configuration
		-- This allows :ObsidianToday to create/open a file in specific folder
		daily_notes = {
			folder = "dailies",
			date_format = "%d-%m-%Y",
			template = "daily-template.md",
		},

		-- 2. Completion (requires nvim-cmp)
		-- This allows you to type [[ and get a list of existing notes
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},

		-- 3. Mappings
		-- Useful keybinds for following links and checkboxes
		mappings = {
			-- "GF" to follow the link under cursor
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes with <leader>ch
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Create a new note from the reference under cursor
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},

		-- 4. Interface settings
		ui = {
			enable = true, -- set to false to disable all additional syntax features
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
			},
		},

		-- 5. Filenames
		note_id_func = function(title)
			if title ~= nil then
				return title
			else
				return tostring(os.time())
			end
		end,

		-- 5a. Clean Frontmatter
		note_frontmatter_func = function(note)
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				return note.metadata
			end

			return {}
		end,

		-- 6. Templates
		templates = {
			subdir = "templates",
			date_format = "%d-%m-%Y",
			time_format = "%H:%M",
			substitutions = {
				yesterday = function()
					return os.date("%Y-%m-%d", os.time() - 86400)
				end,
				tomorrow = function()
					return os.date("%Y-%m-%d", os.time() + 86400)
				end,
			},
		},
	},
	config = function(_, opts)
		require("obsidian").setup(opts)

		-- Fix the UI conceal level
		vim.opt.conceallevel = 2
	end,
}
