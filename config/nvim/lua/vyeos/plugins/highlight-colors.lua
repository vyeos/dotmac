return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			---@usage 'background'|'foreground'|'virtual'
			render = "background",

			---Set virtual symbol (requires render to be set to 'virtual')
			virtual_symbol = "■",

			---Set virtual symbol suffix (defaults to '')
			virtual_symbol_prefix = "",

			---Set virtual symbol suffix (defaults to ' ')
			virtual_symbol_suffix = " ",

			---Set virtual symbol position()
			---@usage 'inline'|'eol'|'eow'
			---inline mimics VS Code style
			---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
			---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
			virtual_symbol_position = "inline",

			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_ansi = true,
			enable_hsl_without_function = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = true,

			---Set custom colors
			---Label must be properly escaped with '%' to adhere to `string.gmatch`
			--- :help string.gmatch
			custom_colors = {
				-- { label = "%-%-theme%-primary%-color", color = "#0f1219" },
				-- { label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
			},

			-- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
			exclude_filetypes = {},
			exclude_buftypes = {},
			-- Exclude buffer from highlighting e.g. 'exclude_buffer = function(bufnr) return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1000000 end'
			exclude_buffer = function(bufnr) end,
		})
	end,
}
-- :HighlightColors On	Turn highlights on
-- :HighlightColors Off	Turn highlights off
-- :HighlightColors Toggle	Toggle highlights
-- :HighlightColors IsActive	Highlights active / disabled
