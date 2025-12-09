return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		-- this will download prebuild binary or try to use existing rustup toolchain to build from source
		-- (if you are using lazy you can use gb for rebuilding a plugin if needed)
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		prompt = "> ",
		title = "Find Files",
		debug = {
			enabled = false,
			show_scores = false,
		},
	},
	lazy = false,
	keys = {
		{
			"<leader>ff",
			function()
				require("fff").find_files()
			end,
			desc = "FFFind files",
		},
		-- {
		-- 	"<leader>fg",
		-- 	function()
		-- 		require("fff").find_in_git_root()
		-- 	end,
		-- 	desc = "Find git files",
		-- },
	},
}
